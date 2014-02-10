" Hides cursorline when in insert mode
augroup xc_cursorline
  au InsertEnter * hi CursorLine ctermbg=None
  au InsertLeave * hi CursorLine ctermbg=18
augroup end
