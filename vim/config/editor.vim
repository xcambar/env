source $HOME/.vim/config/plugins/neomake.vim
source $HOME/.vim/config/plugins/ag.vim

source $HOME/.vim/config/themes/_tmuxline.vim

set scrolloff=8
set directory^=$HOME/.vim/tmp//
set splitbelow
set splitright
set autoindent
set diffopt+=vertical

set pastetoggle=<F12>

nnoremap <c-q> :q<CR>
nnoremap <c-t> :Files<CR>
nnoremap \| :vnew<CR>
nnoremap _ :new<CR>
nnoremap ii i
inoremap ii <Esc>

command Cdb execute "cd %:p:h"

source $HOME/.vim/config/plugins/netrw.vim
" source $HOME/.vim/config/plugins/delimitmate.vim
source $HOME/.vim/config/plugins/nerdtree.vim
source $HOME/.vim/config/plugins/match-control.vim
source $HOME/.vim/config/plugins/vim-move.vim
source $HOME/.vim/config/syntax.vim
source $HOME/.vim/config/plugins/vim-indent-guides.vim
source $HOME/.vim/config/plugins/deoplete.nvim

" Removes trailing wihtespaces
au FileType * au BufWritePre <buffer> :%s/\s\+$//e
let g:rainbow_active = 1
augroup clojure_rainbow
  autocmd!
  au FileType clojure RainbowParentheses
  au FileType clojure nnoremap <c-e> :Eval<cr>
  nnoremap E :%Eval<CR>
  nnoremap <C-e> :Eval<CR>
augroup END

"tabs
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>
nnoremap t1 1gt<CR>
nnoremap t2 2gt<CR>
nnoremap t3 3gt<CR>
nnoremap t4 4gt<CR>
nnoremap t5 5gt<CR>
nnoremap t6 6gt<CR>
nnoremap t7 7gt<CR>
nnoremap t8 8gt<CR>
nnoremap t9 9gt<CR>
nnoremap t0 :tablast<CR>
