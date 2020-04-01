alias ksync="$HOME/Documents/scripts/sync_keepass.sh"
alias evernote="wine $HOME/.wine/drive_c/'Program Files (x86)'/Evernote/Evernote/Evernote.exe &"

alias pbcopy='xargs echo -n | xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias ipython='ipython3'

hxd() { wine $HOME/.wine/drive_c/'Program Files'/HxD/HxD.exe "$1" &}

xfind() { 
    nautilus "$1"
}

xopen() {
    xdg-open "$1"
}

xr() {
    ag --nobreak --nonumbers --noheading . "$1" | fzf --delimiter=: --nth=2..
}

stocks() {
    $HOME/tools/ticker.sh SH BTC-USD ETH-USD AMZN FB SCHW ETSY AMD NVDA
}

export FZF_DEFAULT_COMMAND="find $HOME /dram -type f 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_G_COMMAND="find . -type f 2>/dev/null"
export FZF_ALT_C_COMMAND="find $HOME /dram -type d 2>/dev/null"

tmux
redshift -O 3500
