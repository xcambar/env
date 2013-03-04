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
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>`

"delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

"powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
:set laststatus=2

let g:tagbar_ctags_bin = '/Users/xav/code/esprima-ctags/bin/jstags'
