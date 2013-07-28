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

"powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
:set laststatus=2

" Removes trailing wihtespaces
autocmd FileType javascript,ruby,markdown,html,php autocmd BufWritePre <buffer> :%s/\s\+$//e

"let g:tagbar_ctags_bin = '/Users/xav/code/esprima-ctags/bin/jstags'

set pastetoggle=<F12>

" Open splits nore naturally
set splitbelow
set splitright

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

if $TMUX != ''

  let s:tmux_is_last_pane = 0
  au WinEnter * let s:tmux_is_last_pane = 0

  " Like `wincmd` but also change tmux panes instead of vim windows when needed.
  function s:TmuxWinCmd(direction)
    let nr = winnr()
    let tmux_last_pane = (a:direction == 'p' && s:tmux_is_last_pane)
    if !tmux_last_pane
      " try to switch windows within vim
      exec 'wincmd ' . a:direction
    endif
    " Forward the switch panes command to tmux if:
    " a) we're toggling between the last tmux pane;
    " b) we tried switching windows in vim but it didn't have effect.
    if tmux_last_pane || nr == winnr()
      let cmd = 'tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR')
      call system(cmd)
      let s:tmux_is_last_pane = 1
      echo cmd
    else
      let s:tmux_is_last_pane = 0
    endif
  endfunction

  " navigate between split windows/tmux panes
  nmap <c-j> :call <SID>TmuxWinCmd('j')<cr>
  nmap <c-k> :call <SID>TmuxWinCmd('k')<cr>
  nmap <c-h> :call <SID>TmuxWinCmd('h')<cr>
  nmap <c-l> :call <SID>TmuxWinCmd('l')<cr>
  nmap <c-\> :call <SID>TmuxWinCmd('p')<cr>

end

