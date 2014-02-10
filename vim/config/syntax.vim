" TODO: Fix when multiple windows are opened with the same buffer
" TODO: Works badly with Goyo
augroup SyntaxOnCurrentWindow
  au!
  au VimEnter     * if &ft | setlocal syntax=ON | endif
  au WinEnter     * if &ft | setlocal syntax=ON | endif
  au BufWinEnter  * if &ft | setlocal syntax=ON | endif
  au WinLeave     * setlocal syntax=OFF
  au VimEnter     * setlocal cursorline
  au WinEnter     * setlocal cursorline
  au BufWinEnter  * setlocal cursorline
  au WinLeave     * setlocal nocursorline
augroup END
