set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'editorconfig/editorconfig-vim'
Bundle 'walm/jshint.vim'
Bundle 'scrooloose/syntastic'
Bundle 'chriskempson/base16-vim'
Bundle 'mhinz/vim-signify'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'heartsentwined/vim-emblem'
" Bundle 'tpope/vim-vinegar'
Bundle 'dockyard/vim-easydir'
Bundle 'junegunn/goyo.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'chase/vim-ansible-yaml'
" No longer required since statusline is already generated
" Bundle 'edkolev/tmuxline.vim'
" TODO check why vitality's good:
" Bundle 'sjl/vitality.vim'
" let g:vitality_fix_cursor = 0
Bundle 'junegunn/vim-emoji'

Bundle 'sheerun/vim-polyglot'
" Replaces the following:
  " Bundle 'kchmck/vim-coffee-script'
  " Bundle 'nono/vim-handlebars'
  " Bundle 'tpope/vim-markdown'
  " Bundle 'slim-template/vim-slim'
  " Bundle 'othree/html5.vim'
  " Bundle 'guns/vim-clojure-static'
  " Bundle 'vim-ruby/vim-ruby'


set hidden
set shortmess+=I
syntax on
set number
set nowrap
set mouse=a
set cursorline

au VimEnter * NoMatchParen

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap ? :noh<cr>

set termencoding=utf-8
set encoding=utf-8

set ttyfast
set ttymouse=xterm2
set lazyredraw

set nobackup
set noswapfile
set autoindent
set copyindent

filetype plugin indent on

set timeout timeoutlen=300 ttimeoutlen=100

" Fixes the backspace key
set backspace=indent,eol,start

" Yank to and paste the
" selection without prepending "* to commands.
" @see https://github.com/pda/dotvim/blob/master/vimrc
set clipboard=unnamed

let g:mapleader = ";"
let mapleader = ";"
" Distraction-free map
nnoremap <Leader>z :Goyo<cr>

source $HOME/.vim/config/themes/base16.vim
source $HOME/.vim/config/plugins/syntastic.vim
source $HOME/.vim/config/plugins/ag.vim
source $HOME/.vim/config/plugins/vim-emoji.vim

source $HOME/.vim/config/themes/_tmuxline.vim

if !exists('vimpager')
  source $HOME/.vim/config/editor.vim
else
  source $HOME/.vim/config/pager.vim
endif

source $HOME/.vim/config/plugins/vim-indent-guides.vim
