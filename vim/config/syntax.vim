" TODO: Fix when multiple windows are opened with the same buffer
augroup SyntaxOnCurrentWindow
  au!
  au VimEnter     * if getwinvar(winnr(), '&ft') != '' | setlocal syntax=ON | endif
  au WinEnter     * if getwinvar(winnr(), '&ft') != '' | setlocal syntax=ON | endif
  au BufEnter     * if getwinvar(winnr(), '&ft') != '' | setlocal syntax=ON | endif
  au BufWinEnter  * if getwinvar(winnr(), '&ft') != '' | setlocal syntax=ON | endif
  au WinLeave     * setlocal syntax=OFF

  au VimEnter     * setlocal cursorline
  au WinEnter     * setlocal cursorline
  au BufEnter     * setlocal cursorline
  au BufWinEnter  * setlocal cursorline
  au WinLeave     * setlocal nocursorline
augroup END
