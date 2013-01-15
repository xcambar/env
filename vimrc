runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()

syntax on
set number
set nowrap

set softtabstop=2 shiftwidth=2 expandtab

set ignorecase
set smartcase
set incsearch

set cursorline

filetype plugin indent on

set background=dark
colorscheme solarized

set directory^=$HOME/.vim/tmp//

" Fixes the backspace key
set backspace=indent,eol,start
