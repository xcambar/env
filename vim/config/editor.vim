Bundle 'eiginn/netrw'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
" Give a try at kana/vim-smartinput if delimitMate screws up again
" Bundle 'kana/vim-smartinput'
Bundle 'majutsushi/tagbar'
"Bundle 'joonty/vdebug'
Bundle 'tpope/vim-surround'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fireplace.git'
Bundle 'guns/vim-clojure-static.git'
Bundle 'tpope/vim-classpath.git'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'
Bundle 'mattn/emmet-vim'

set scrolloff=8
set directory^=$HOME/.vim/tmp//
set pastetoggle=<F12>

" Open splits more naturally
set splitbelow
set splitright

nnoremap <c-q> :q<CR>
nnoremap <F2> :Ex<CR>
nnoremap <leader>a :Ag 
nnoremap \| :vnew<CR>:CtrlP <CR>
nnoremap _ :new<CR>:CtrlP <CR>
nnoremap ii i
inoremap ii <Esc>

source $HOME/.vim/config/plugins/airline.vim
source $HOME/.vim/config/plugins/delimitmate.vim

" Removes trailing wihtespaces
au FileType javascript,ruby,markdown,html,php au BufWritePre <buffer> :%s/\s\+$//e

" TODO: Fix when multiple windows are opened with the same buffer
" TODO: Works badly with Goyo
augroup SyntaxOnCurrentWindow
  au!
  au VimEnter     * setlocal syntax=ON
  au WinEnter     * setlocal syntax=ON
  au BufWinEnter  * setlocal syntax=ON
  au WinLeave     * setlocal syntax=OFF
  au VimEnter     * setlocal cursorline
  au WinEnter     * setlocal cursorline
  au BufWinEnter  * setlocal cursorline
  au WinLeave     * setlocal nocursorline
augroup END

" Use the tree style in netrw ny default
let g:netrw_liststyle=3

" show over-long lines
augroup xc_over_line
  au BufEnter * hi OverLineStart ctermbg=196
  au BufEnter * hi OverLine term=bold,underline cterm=bold,underline ctermbg=18
  au BufEnter * call matchadd('OverlineStart', '\%81v.')
  au BufEnter * call matchadd('Overline', '\%82v.\+')
augroup END

" Hides cursorline when in insert mode
augroup xc_cursorline
  au InsertEnter * hi CursorLine ctermbg=None
  au InsertLeave * hi CursorLine ctermbg=18
augroup end
