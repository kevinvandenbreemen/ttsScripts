#!/bin/bash

# Executes sable conversion using Ubuntu image.  You must have run setup.sh before using this command

if [[ -z ${1} ]]
then
    echo "Missing filename"
fi

volname=`pwd`/data
filename=${1}
cd `dirname $0`
rm -rf ${volname}/*
cp ${filename} ${volname}/toConvert

docker run --mount type=bind,source=${volname},target=/ttsio tts:0.1
docker ps -a | awk '{ print $1,$2 }' | grep tts | awk '{print $1}' | xargs -I {} docker rm {} && echo "Cleared dockerfile.  👍️😎️"