" TODO: Fix when multiple windows are opened with the same buffer
hi Inactive ctermfg=8
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

  au VimEnter     * setlocal relativenumber
  au WinEnter     * setlocal relativenumber
  au BufEnter     * setlocal relativenumber
  au BufWinEnter  * setlocal relativenumber
  au WinLeave     * setlocal norelativenumber



  au WinLeave     * syntax region Inactive start='^' end='$'
  au BufLeave     * syntax region Inactive start='^' end='$'
augroup END
