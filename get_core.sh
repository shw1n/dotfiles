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

# Main
prompt "Install tmux and ag?" install_tmux_ag
prompt "Install keepassxc?" install_keepass
prompt "Install fzf?" install_fzf
prompt "Install evernote?" install_evernote
prompt "Install grive and .griveignore?" install_grive
