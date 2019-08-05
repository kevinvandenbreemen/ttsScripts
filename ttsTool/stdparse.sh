#!/bin/bash

#Std Cuts

if [[ -z ${1} ]]
then
	echo "Standard parser.  Prepares a file for conversion into a sable document."
	echo "Usage:  <file to prepare>"
	exit 1
fi

# The name is the filename stripped of its extension
name=`echo "${1}" | sed "s/\..*//"`

# Create a filename for an updated file
updatedfile=${name}.tmp

sed "s/[&][#].*[;]//" ${1} > ${updatedfile}
sed -i "s/[<>]//g" ${updatedfile}
sed -i "s/[:][ ]*[=][/\\^]*[=]/<BREAK LEVEL=\"Medium\" \/><RATE SPEED=\"+140%\"><PITCH BASE=\"highest\" MIDDLE=\"high\" RANGE=\"90%\" >biblipiblib<\/PITCH><\/RATE><BREAK LEVEL=\"Medium\" \/>  /g" ${updatedfile}
sed -i "s/[=][/\\^]*[=]//g" ${updatedfile}
sed -i "s/OOC/Out of character: /g" ${updatedfile}
sed -i "s/*//g" ${updatedfile}
sed -i "s/http:\/\/[^ ]*/URL.  /g" ${updatedfile} 
sed -i "s/[.]/<BREAK LEVEL=\"Large\" ><\/BREAK>\n\n/g" ${updatedfile}
sed -i "s/IC[:]* /In character: /g" ${updatedfile}
sed -i "s/[bB]ajoran/<RATE SPEED=\"20%\">Ba<EMPH>jor<\/EMPH>an<\/RATE>/g" ${updatedfile}
sed -i "s/[cC][oO][mM][pP][uU][tT][eE][rR][ ]*[:]*[ ]*[=][/\\^]*[=]/Computer: /g" ${updatedfile}
sed -i "s/\([a-zA-Z]*\)[!]/<RATE SPEED=\"+20%\"><EMPH>\1<\/EMPH><\/RATE>/g" ${updatedfile}
sed -i "s/[\&]/ and /g" ${updatedfile}
sed -i "s/[\$]//g" ${updatedfile}

# Get rid of apostrophe-S bug, where festival reads it like it's an acronym
sed -i "s/['][sS]/s/g" ${updatedfile}

# Get rid of expressions contained in square brackets
sed -i "s/[[][^]]*[]]//g" ${updatedfile}

sed -i "s/[ ][:][)D]/<BREAK LEVEL=\"Medium\" \/><PITCH BASE=\"highest\" MIDDLE=\"high\" RANGE=\"120%\" >Smiley!<\/PITCH>./g" ${updatedfile}
sed -i "s/[ ][:][p]/<BREAK LEVEL=\"Medium\" \/><PITCH BASE=\"highest\" MIDDLE=\"high\" RANGE=\"120%\" >Giggle smiley<\/PITCH>/g" ${updatedfile}
sed -i "s/[ ][:][(]/<BREAK LEVEL=\"Medium\" \/><PITCH BASE=\"lowest\" MIDDLE=\"low\" RANGE=\"120%\" >Sad-emoticon.  Bummer<\/PITCH>./g" ${updatedfile}

echo "Parse complete"
