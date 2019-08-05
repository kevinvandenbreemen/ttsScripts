#!/bin/bash

volname=`pwd`/data

cd `dirname $0`

docker build --tag tts:0.1 .

docker run -it --mount type=bind,source=${volname},target=/ttsio tts:0.1