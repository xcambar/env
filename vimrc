set nocompatible


filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'editorconfig/editorconfig-vim'
Bundle 'walm/jshint.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'mhinz/vim-signify'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'heartsentwined/vim-emblem'
Bundle 'othree/html5.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-vinegar'
Bundle 'dockyard/vim-easydir'
Bundle 'junegunn/goyo.vim'

syntax on
set number
set nowrap
set mouse=a
set nocursorline
au VimEnter * NoMatchParen

set softtabstop=2 shiftwidth=2 expandtab

set ignorecase
set smartcase
set incsearch

set termencoding=utf-8
set encoding=utf-8

filetype plugin indent on

set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set timeout timeoutlen=300 ttimeoutlen=100

" Fixes the backspace key
set backspace=indent,eol,start

" Syntactic checks files on open
let g:syntastic_check_on_open=1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" Distraction-free map
nnoremap <S-F11> :Goyo<cr>

if !exists('$VIMPAGER')
  source $HOME/.vim/config/editor.vim
else
  set scrolloff=0
  let vimpager_scrolloff=0
  nnoremap <v> <nop>
endif
  
