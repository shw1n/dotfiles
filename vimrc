set number
set tabstop=4
set shiftwidth=4
set expandtab

set autochdir


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

hi Comment ctermfg=LightBlue

"Enables filetype detection and auto-indentation handling"
"custom filetype plugins in ~/.vim/ftplugin"
filetype plugin indent on

"Changing tab completion on vim"
set wildmode=longest,list,full
set wildmenu

"Setting incremental search and search highlighting"
set incsearch
set hlsearch
