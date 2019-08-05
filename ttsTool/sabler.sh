#!/bin/bash

if [[ -z ${1} ]]
then
	echo "Usage:  <file to record>"
	exit 1
fi
	

name=${1}

parsefile=stdparse

# Speedup rate in speech of the header/footer of the data
hfrate=90
if [[ -z ${2} ]]
then
	parsefile=stdparse
else
	parsefile=${2}
	echo "Using parse file ${parsefile}.sh"
fi

# The name is the filename stripped of its extension
name=`echo "${name}" | sed "s/\..*//"`

# Create a filename for an updated file
updatedfile=${name}.tmp

# Go through the file and strip messed up characters.
./${parsefile}.sh ${1}


echo "<RATE SPEED=\"+${hfrate}%\">`date '+%A, %B %e, %Y, %H hundred %M hrs'`  di di di dit.</RATE>" |cat - ${updatedfile} > /tmp/out && mv /tmp/out ${updatedfile}
echo "<RATE SPEED=\"+${hfrate}%\">di di di di from `hostname`.  End of data</RATE>" >> ${updatedfile}

echo "Pre-processed and stripped tags.  Proceeding to run festival..."

# TODO	Sable replacement stuff here

sablefile=${name}.sable
cat resource/sable_pre.xml ${updatedfile} resource/sable_post.xml > ${sablefile}
#text2wave ${sablefile} -o tmp.wav -f 20000 -scale 3
#lame tmp.wav  ${name}.mp3
./runOnSableFile.sh ${name}

echo "Converted.  Cleaning up and exiting."

# rm ${updatedfile}
# rm ${sablefile}
