#!/bin/bash

# Run this from the dotfiles/ folder

# Prompt user function, usage:
# prompt "Install [tmux|fzf|etc]?" install_tmux
prompt() {
    read -p "$1 (y/n)" -n 1 -r
    echo
    if [[  $REPLY =~ ^[Nn]$ ]]
    then
        echo "Skipping..."
    else
        $2 
    fi
}


install_tmux_ag() {
sudo apt install tmux silversearcher-ag 
}

install_keepass() {
sudo apt install keepassxc
}

install_fzf() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    mv ~/.fzf/shell/key-bindings.bash ~/.fzf/shell/key-bindings.bash.orig
    cp key-bindings.bash ~/.fzf/shell/key-bindings.bash
    export FZF_CTRL_G_COMMAND=find . -type f 2>/dev/null
}


# assumes wine is installed
# evernote (must install version 5.8.13.8152)
install_evernote() {
    wget "https://archive.org/download/Evernote5.8.13.8152/Evernote_5.8.13.8152.exe" -O /tmp/evernote.exe
    chmod +x /tmp/evernote.exe
    wine /tmp/evernote.exe
}

# grive

# Shouldn't have to do this again (client keys are already in script), but just in case:

# Google recently blocked grive's API's for general use, so to make it work
# you must use your own API keys instead of vitalif's 

#1 - Go to https://console.developers.google.com/apis/library. Login with your Google account and create a new project on Google Cloud Platform. You can also use an existing one.
#2 - Search for Google Drive API and enable it.
#3 - Go to API Credentials page (https://console.developers.google.com/apis/credentials)
#3 - Create a new OAuth Client credential. You will be provided with a id and a secret. Save both because you gonna need it for grive2.
#Then you need to follow this repo README, download grive2, build and install. Then run
#
#grive -a --id [client id] --secret [client secret]
#
#On your Drive folder and it will probably work.
#If you want to use your ID and secret to build grive2 instead of using above command, you can edit the keys in
#
#grive2/grive/src/main.cc
#
#Lines 49 to 50 in 3929909
# const std::string default_id            = "615557989097-i93d4d1ojpen0m0dso18ldr6orjkidgf.apps.googleusercontent.com" ; 
# const std::string default_secret        = "xiM8Apu_WuRRdheNelJcNtOD" ; 

install_grive() {
    mkdir $HOME/google-drive

    # This .griveignore only loads keepass by default
    cp griveignore $HOME/google-drive/.griveignore

    # Build grive
    sudo apt-get install git cmake build-essential libgcrypt20-dev libyajl-dev \
            libboost-all-dev libcurl4-openssl-dev libexpat1-dev libcppunit-dev binutils-dev \
                debhelper zlib1g-dev dpkg-dev pkg-config
    git clone https://github.com/vitalif/grive2.git $HOME/tools/grive2
    cd $HOME/tools/grive2
    dpkg-buildpackage --no-sign

    # Install grive
    cd build
    sudo make install
    cd $HOME/google-drive
    grive -a --id 199239432923-440ikkm4v8n75c3gp0cjju1gblaechk5.apps.googleusercontent.com --secret JftXBH5MiQAZJU6DxeB-M0Vw
}

# Main
prompt "Install tmux and ag?" install_tmux_ag
prompt "Install keepassxc?" install_keepass
prompt "Install fzf?" install_fzf
prompt "Install evernote?" install_evernote
prompt "Install grive and .griveignore?" install_grive
