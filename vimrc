set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'sjl/gundo.vim'
Bundle 'walm/jshint.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'joonty/vdebug'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'nono/vim-handlebars'
Bundle 'heavenshell/vim-jsdoc'
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-surround'


syntax on
set number
set nowrap

set softtabstop=2 shiftwidth=2 expandtab

set ignorecase
set smartcase
set incsearch

set cursorline

set termencoding=utf-8
set encoding=utf-8

filetype plugin indent on

set background=dark
" solarized options 
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

set directory^=$HOME/.vim/tmp//

" Fixes the backspace key
set backspace=indent,eol,start

set scrolloff=8

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :GundoToggle<CR>
"Remap Tab to Esc. Use Ctrl-d/t in insert mode to indent/outdent
inoremap <Space><Space> <Esc>
nnoremap <Space><Space> i

"delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

"powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
:set laststatus=2

autocmd FileType javascript,ruby,markdown,html,php autocmd BufWritePre <buffer> :%s/\s\+$//e

"let g:tagbar_ctags_bin = '/Users/xav/code/esprima-ctags/bin/jstags'



" Not very efficient ATM
" TODO: Fix when multiple windows are opened with the same buffer
augroup SyntaxOnCurrentWindow
  set syntax=OFF
  au!
  " autocmd that will set up the w:created variable
  autocmd VimEnter * autocmd WinEnter * set syntax=ON
  autocmd VimEnter * autocmd WinLeave * set syntax=OFF

  "" Consider this one, since WinEnter doesn't fire on the first window created when Vim launches.
  "" You'll need to set any options for the first window in your vimrc,
  "" or in an earlier VimEnter autocmd if you include this
  "autocmd VimEnter * let w:created=1

  "autocmd WinEnter * if exists('w:created') | set syntax=ON | endif
  "autocmd WinLeave * set syntax=OFF
  
  "" Example of how to use w:created in an autocmd to initialize a window-local option
  "autocmd BufEnter * set syntax=ON
augroup END
