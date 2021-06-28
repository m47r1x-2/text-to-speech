#!/bin/bashclear

###############################################################


clear

apt update && apt upgrade

cd $HOME

rm -rf text-to-speech

git clone https://github.com/m47r1x-2/text-to-speech.git

cd text-to-speech

bash tts.sh
