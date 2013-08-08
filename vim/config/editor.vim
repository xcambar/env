Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
" Give a try at kana/vim-smartinput if delimitMate screws up again
"Bundle 'sjl/gundo.vim'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"Bundle 'majutsushi/tagbar'
"Bundle 'joonty/vdebug'
"Bundle 'heavenshell/vim-jsdoc'
Bundle 'tpope/vim-surround'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'tomtom/tcomment_vim'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-fireplace.git'
Bundle 'tpope/vim-classpath.git'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'

set cursorline

set scrolloff=8
set directory^=$HOME/.vim/tmp//

nnoremap <F2> :NERDTreeToggle<CR>

nnoremap \| :vnew<CR>:CtrlP <CR>
nnoremap _ :new<CR>:CtrlP <CR>
nnoremap <Space><Space> i
inoremap <Space><Space> <Esc>
"delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

let g:airline_powerline_fonts = 1
set laststatus=2
"let g:bufferline_echo = 0

" Removes trailing wihtespaces
autocmd FileType javascript,ruby,markdown,html,php autocmd BufWritePre <buffer> :%s/\s\+$//e

set pastetoggle=<F12>

" Open splits nore naturally
set splitbelow
set splitright

" Automatically quit NERDTree if it's the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

augroup CursorLine
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" TODO: Fix when multiple windows are opened with the same buffer
augroup SyntaxOnCurrentWindow
  au!
  au VimEnter * setlocal syntax=ON
  au WinEnter * setlocal syntax=ON
  au BufWinEnter * setlocal syntax=ON
  au WinLeave * setlocal syntax=OFF
augroup END
