set tabstop=2
set shiftwidth=2
set expandtab

" Remove trailing whitespace on save"
autocmd BufWritePre * :%s/\s\+$//e
