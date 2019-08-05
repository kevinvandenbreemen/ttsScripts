# TTS Tool

## How to Use

Be sure you have Docker installed!

First run the setup script:

```
./setup.sh
```

Next you can run the tool by running the doIt.sh script.  The result of theconversion will be stored to the data directory.

```
doIt.sh /path/to/myFile
```

The tool will generate an mp3 file called data/toConvert.mp3 in the directory of this project.

# Future Changes

At the moment maintaining this script and prettying it up isn't a huge priority.  However I do have a few mods I'd love to make to it.

1.  Ability to run this from any directory (right now you need to run it inside the same directory as the Dockerfile)
2.  Rename and move the output file to directory from which user called the script

# Background
I wrote this dockerized version after I discovered that Festival (the text2wave command in particular) seemed to crash a lot on newer versions of Ubuntu.
