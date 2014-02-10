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
set splitbelow
set splitright

set pastetoggle=<F12>

nnoremap <c-q> :q<CR>
nnoremap <leader>a :Ag 
nnoremap \| :vnew<CR>
nnoremap _ :new<CR>
nnoremap ii i
inoremap ii <Esc>

source $HOME/.vim/config/plugins/netrw.vim
source $HOME/.vim/config/plugins/airline.vim
source $HOME/.vim/config/plugins/delimitmate.vim
source $HOME/.vim/config/syntax.vim
source $HOME/.vim/config/overline.vim
source $HOME/.vim/config/cursorline.vim

" Removes trailing wihtespaces
au FileType javascript,ruby,markdown,html,php au BufWritePre <buffer> :%s/\s\+$//e
