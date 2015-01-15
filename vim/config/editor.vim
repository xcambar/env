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
