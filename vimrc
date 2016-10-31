if !has('nvim')
  set nocompatible
endif

" See https://github.com/sheerun/vim-polyglot/blob/master/config.vim#L2-L4
let g:jsx_ext_required = 1

call plug#begin('~/.vim/plugins')

Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
if !has('nvim')
  Plug 'wincent/terminus' "dosn't work with Neovim (yet)
endif
Plug 'thinca/vim-localrc'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-emoji', { 'for': 'markdown' }
" Plug 'luochen1990/rainbow'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'

" Editor Only
if !exists('vimpager')
  set rtp+=/usr/local/opt/fzf "FZF
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-fugitive'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim' "commentary
  Plug 'rking/ag.vim'
  Plug 'mattn/emmet-vim'
  " TODO Replace with xcambar/vim-match-control
  Plug 'dirkwallenstein/vim-match-control'
  Plug 'matze/vim-move'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'walm/jshint.vim'
  " Plug 'scrooloose/syntastic'
  Plug 'benekastah/neomake'
  Plug 'dockyard/vim-easydir'
  Plug 'junegunn/goyo.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'majutsushi/tagbar'
  Plug 'junegunn/fzf', { 'do': 'yes \| ./install'  }
  Plug 'junegunn/fzf.vim'
  " Clojure
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  Plug 'tpope/vim-classpath', { 'for': 'clojure' }
  Plug 'guns/vim-sexp', { 'for': 'clojure' }
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
  " Python
  Plug 'nvie/vim-flake8', { 'for': 'python' }
  Plug 'kennethzfeng/vim-raml'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'archSeer/elixir.nvim' "for deoplete support
  Plug 'Shougo/deoplete.nvim'
  autocmd VimEnter * source $HOME/.vim/config/editor.vim
else
  autocmd VimEnter * source $HOME/.vim/config/pager.vim
endif
call plug#end()

source $HOME/.vim/config/themes/base16.vim
source $HOME/.vim/config/plugins/vim-emoji.vim

set hidden
set shortmess+=I
syntax on
set number
set relativenumber
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

set list
set listchars=tab:->,trail:~,extends:>,precedes:<

set termencoding=utf-8
set encoding=utf-8

if !has('nvim')
  set ttyfast
  set ttymouse=xterm2
endif
set lazyredraw

set nobackup
set noswapfile
set autoindent
set copyindent

filetype plugin indent on

set timeout timeoutlen=300 ttimeoutlen=100

" Fixes the backspace key
set backspace=indent,eol,start
"See https://github.com/neovim/neovim/issues/2048#issuecomment-78534227
if has('nvim')
  nmap <BS> <C-W>h
endif

" Yank to and paste the
" selection without prepending "* to commands.
" @see https://github.com/pda/dotvim/blob/master/vimrc
set clipboard=unnamed

let g:mapleader = ";"
let mapleader = ";"
" Distraction-free map
nnoremap <Leader>z :Goyo<cr>

set laststatus=1

highlight LineNr ctermbg=None ctermfg=8
highlight CursorLineNr ctermbg=20 ctermfg=18
highlight clear SignColumn
highlight GitGutterAdd ctermbg=None
highlight GitGutterChange ctermbg=None
highlight GitGutterDelete ctermbg=None
highlight GitGutterChangeDelete ctermbg=None
highlight CursorLine ctermbg=None
highlight NonText ctermfg=None

nnoremap Q <nop>

map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
" map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :split <C-R>=expand("%:p:h") . "/" <CR>

let g:surround_no_insert_mappings = 1
inoremap <silent> <C-E> <C-R>=AutoPairsInsert('{')<CR>
inoremap <silent> <C-R> <C-R>=AutoPairsInsert('}')<CR>
inoremap <silent> <C-D> <C-R>=AutoPairsInsert('(')<CR>
inoremap <silent> <C-F> <C-R>=AutoPairsInsert(')')<CR>
inoremap <silent> <C-X> <C-R>=AutoPairsInsert('[')<CR>
inoremap <silent> <C-C> <C-R>=AutoPairsInsert(']')<CR>

vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
