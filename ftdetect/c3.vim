" https://github.com/konimarti/c3.vim
" Copyright (c) 2024 Koni Marti <koni.marti@gmail.com>
" Copyright (c) 2023-2024 Airbus5717
" Copyright (c) 2017 Tetralux

au BufNewFile,BufRead *.c3,*.c3i set filetype=c3
autocmd FileType c3 setlocal commentstring=//\ %s
