alias ksync="$HOME/Documents/scripts/sync_keepass.sh"
alias evernote="wine $HOME/.wine/drive_c/'Program Files (x86)'/Evernote/Evernote/Evernote.exe &"

hxd() { wine $HOME/.wine/drive_c/'Program Files'/HxD/HxD.exe z:\\"$1" &}

xfind() { 
    nautilus "$1"
}

xopen() {
    xdg-open "$1"
}

export FZF_DEFAULT_COMMAND="find $HOME -type f 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="find $HOME -type d 2>/dev/null"

tmux
redshift -O 3500
