Bundle 'eiginn/netrw'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'majutsushi/tagbar'
"Bundle 'joonty/vdebug'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fireplace.git'
Bundle 'tpope/vim-leiningen.git'
Bundle 'tpope/vim-classpath.git'
Bundle "guns/vim-sexp"
Bundle "tpope/vim-sexp-mappings-for-regular-people"
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdtree'
" TODO Replace with xcambar/vim-match-control
Bundle 'dirkwallenstein/vim-match-control'
Bundle 'matze/vim-move.git'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rails'
Bundle 'szw/vim-ctrlspace'
Bundle "marijnh/tern_for_vim"
Bundle 'editorconfig/editorconfig-vim'
Bundle 'walm/jshint.vim'
Bundle 'scrooloose/syntastic'
Bundle 'dockyard/vim-easydir'
Bundle 'junegunn/goyo.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'chase/vim-ansible-yaml'

source $HOME/.vim/config/plugins/syntastic.vim
source $HOME/.vim/config/plugins/ag.vim

source $HOME/.vim/config/themes/_tmuxline.vim

set scrolloff=8
set directory^=$HOME/.vim/tmp//
set splitbelow
set splitright
set autoindent

set pastetoggle=<F12>

nnoremap <c-q> :q<CR>
nnoremap <leader>a :Ag 
nnoremap \| :vnew<CR>
nnoremap _ :new<CR>
nnoremap ii i
inoremap ii <Esc>

command Cdb execute "cd %:p:h"

source $HOME/.vim/config/plugins/netrw.vim
source $HOME/.vim/config/plugins/airline.vim
" source $HOME/.vim/config/plugins/delimitmate.vim
source $HOME/.vim/config/plugins/nerdtree.vim
source $HOME/.vim/config/plugins/match-control.vim
source $HOME/.vim/config/plugins/vim-move.vim
source $HOME/.vim/config/syntax.vim
source $HOME/.vim/config/cursorline.vim
source $HOME/.vim/config/plugins/vim-indent-guides.vim

" Removes trailing wihtespaces
au FileType javascript,ruby,markdown,html,php au BufWritePre <buffer> :%s/\s\+$//e
augroup clojure_rainbow
  autocmd!
  au FileType clojure au VimEnter * RainbowParenthesesActivate
  au FileType clojure au Syntax * RainbowParenthesesLoadRound
  au FileType clojure au Syntax * RainbowParenthesesLoadSquare
  au FileType clojure au Syntax * RainbowParenthesesLoadBraces
  nnoremap <C-e> :Eval<cr>
  " nnoremap E :%Eval<cr>
augroup END
