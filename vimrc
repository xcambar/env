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
Bundle 'chriskempson/base16-vim'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'airblade/vim-gitgutter'
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
Bundle 'vim-ruby/vim-ruby'
Bundle 'edkolev/tmuxline.vim'

syntax on
set number
set nowrap
set mouse=a
set cursorline

au VimEnter * NoMatchParen

set softtabstop=2 shiftwidth=2 expandtab

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

filetype plugin indent on

set timeout timeoutlen=300 ttimeoutlen=100

" Fixes the backspace key
set backspace=indent,eol,start

" Link vim's default delete/yank register to the system clipboard.
" When the "unnamed" string is included in the 'clipboard' option, the unnamed
" register is the same as the "* register.  Thus you can yank to and paste the
" selection without prepending "* to commands.
" @see https://github.com/pda/dotvim/blob/master/vimrc
set clipboard=unnamed

source $HOME/.vim/config/plugins/syntastic.vim
source $HOME/.vim/config/plugins/ag.vim

let g:mapleader = ";"
let mapleader = ";"
" Distraction-free map
nnoremap <Leader>z :Goyo<cr>

source $HOME/.vim/config/themes/base16.vim
source $HOME/.vim/config/themes/_tmuxline.vim

if !exists('vimpager')
  source $HOME/.vim/config/editor.vim
else
  set scrolloff=0
  let vimpager_scrolloff=0
  nnoremap <v> <nop>
endif

source $HOME/.vim/config/themes/base16.vim
source $HOME/.vim/config/themes/_tmuxline.vim

