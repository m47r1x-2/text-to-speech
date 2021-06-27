#!/bin/bash

detect_distro() {
    if [[ "$OSTYPE" == linux-android* ]]; then
            distro="termux"
    fi

    if [ -z "$distro" ]; then
        distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    fi

    if [ -z "$distro" ]; then
        if [ -f "/etc/os-release" ]; then
            distro="$(source /etc/os-release && echo $ID)"
        elif [ "$OSTYPE" == "darwin" ]; then
            distro="darwin"
        else 
            distro="invalid"
        fi
    fi
}



pause() {
    echo -e "\033[1m \033[91m  Press CTRL + z to Stop \033[0m "
    read -n1 -r -p "Press any key to continue..." key
}


init_environ(){
    declare -A backends; backends=(
        ["arch"]="pacman -S --noconfirm"
        ["debian"]="apt-get -y install"
        ["ubuntu"]="apt -y install"
        ["termux"]="apt -y install"
        ["fedora"]="yum -y install"
        ["redhat"]="yum -y install"
        ["SuSE"]="zypper -n install"
        ["sles"]="zypper -n install"
        ["darwin"]="brew install"
        ["alpine"]="apk add"
    )

    INSTALL="${backends[$distro]}"

    if [ "$distro" == "termux" ]; then
        PYTHON="python"
        SUDO=""
    else
        PYTHON="python3"
        SUDO="sudo"
    fi
    PIP="$PYTHON -m pip"
}



banner() {
    clear
    echo -e "\e[1;31m"
    if ! [ -x "$(command -v figlet)" ]; then
        echo 'Introducing MATRIX'
    else
        figlet Text2Voice
    fi
    if ! [ -x "$(command -v toilet)" ]; then
        echo -e "\e[4;34m This Bomber Was Modify By \e[1;32mMATRIX \e[0m"
    else
        echo -e "\e[1;33mCreated By \e[1;32m"
        toilet -f mono12 -F border MATRIX
        
    fi
    echo -e "\e[1;32m For Any Queries Join Me!!!\e[0m"
    
    echo -e "\e[4;32m   YouTube: https://youtube.com/channel/UCUagOLyRyVbreJQR6-Swkvw \e[0m"
    echo " "
    
    echo " "
}

install_deps(){
    
    packages=(openssl git $PYTHON $PYTHON-pip figlet toilet)
    if [ -n "$INSTALL" ];then
        for package in ${packages[@]}; do
            $SUDO $INSTALL $package
        done
        apt install mpg123 -y
        pip install gTTS 
        apt update && apt upgrade -y
        cd $HOME
        mkdir storage/music/ttsVoice
        cd $HOME
        cd ttsVoice
        
    else
        echo "We could not install dependencies."
        echo "Please make sure you have git, python3, pip3 and requirements installed."
        echo "Then you can execute bomber.py ."
        exit
    fi
}





banner
pause
detect_distro
init_environ
if [ -f .update ];then
    echo "All Requirements Found...."
else
    echo 'Installing Requirements....'
    echo .
    echo .
    install_deps
    echo This Script Was Made By MATRIX > .update
    echo 'Requirements Installed....'
    pause
fi




     python text_to_voice.py
     
     cp *.mp3 ~/storage/music/ttsVoice/
     rm -rf *.mp3

     sleep 2
     
     pause
     bash tts.sh
     
     
     
   