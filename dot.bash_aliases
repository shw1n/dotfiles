##### Initialize Path #####

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/games

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

##### Env Variables #####

export FCEDIT=vim
export EDITOR=vim
export PAGER=less

export FZF_DEFAULT_COMMAND="find $HOME /dram -type f 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_G_COMMAND="find . -type f 2>/dev/null"
export FZF_ALT_C_COMMAND="find $HOME /dram -type d 2>/dev/null"
export FZF_ALT_G_COMMAND="find . -type d 2>/dev/null"

##### Aliases #####

alias balias="vim ~/.bash_aliases"
alias ksync="$HOME/Documents/scripts/sync_keepass.sh"
alias evernote="wine $HOME/.wine/drive_c/'Program Files (x86)'/Evernote/Evernote/Evernote.exe &"

alias pbcopy='xargs echo -n | xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias ipython='ipython3'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias lh='ls -lh'

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



# Start xbindkeys if it isn't running already
if ! pgrep -x "xbindkeys" > /dev/null
then
    xbindkeys -f ~/.xbindkeysrc 
fi

tmux
redshift -O 3500
#redshift -O 5000

# Source local non-version-controlled aliases if they exist
if [ -f ~/.bash_aliases.local ]; then
    source ~/.bash_aliases.local
fi
