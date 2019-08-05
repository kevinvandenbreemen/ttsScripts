#!/bin/bash

if [[ -z $1 ]]
then
	echo "Please specify extensionless name"
	exit 1
fi

name=$1

sablefile=${name}.sable
echo "Generating mp3 with ${sablefile}...."

# Frequency argument (-f) below can cause the generated sound files to be clipped
# If this happens try some tweaking.  Use the test file to finally find a point at which
# Cutoff no longer occurs
text2wave ${sablefile} -o tmp.wav -f 16000 -scale 3

echo "This next part requires that sox be installed!"
mv tmp.wav presox.wav
sox presox.wav tmp.wav speed 1.1

lame tmp.wav  ${name}.mp3
rm tmp.wav presox.wav

echo "Generated!  Have fun :) "
