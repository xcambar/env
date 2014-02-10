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
