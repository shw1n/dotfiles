""" VUNDLE BEGIN INIT
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"""
"ONLY EDIT BELOW THIS LINE, ADD YOUR PLUGINS
"Autocomplete
Plugin 'davidhalter/jedi-vim'
"ONLY EDIT ABOVE THIS LINE, ADD YOUR PLUGINS

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" To install vundle on new system:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" Then open vim and run :PluginInstall
"

"""" VUNDLE END



set belloff=all "no annoying sounds
set number
set tabstop=4
set shiftwidth=4
set expandtab

"Ignore case during vim search, '\C' to make sensitive
"on stock vim use '\c' to make case ins
set ignorecase

set autochdir

" Set peristent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000

set laststatus=2

"Overwritten by ctags.vim, keeping here for baseline
set statusline=%F,%c-%l/%L

set tags=tags;/

"ctags.vim function in the status line setting
"let g:ctags_path='/usr/bin/ctags'
"let g:ctags_args='-I __declspec+'
let g:ctags_statusline=1
let generate_tags=1
let g:ctags_title=1

" Fix colors
hi Comment guifg=LightBlue ctermfg=LightBlue
hi Title guifg=LightBlue ctermfg=LightBlue
hi Special guifg=LightBlue ctermfg=LightBlue

"Enables filetype detection and auto-indentation handling"
"custom filetype plugins in ~/.vim/ftplugin"
filetype plugin indent on

"Changing tab completion on vim"
set wildmode=longest,list,full
set wildmenu

"Setting incremental search and search highlighting"
set incsearch
set hlsearch
hi Search cterm=NONE ctermfg=black ctermbg=blue




