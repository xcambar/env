" show over-long lines
augroup xc_over_line
  au BufEnter * hi OverLineStart ctermbg=196
  au BufEnter * hi OverLine term=bold,underline cterm=bold,underline ctermbg=18
  au BufEnter * call matchadd('OverlineStart', '\%81v.')
  au BufEnter * call matchadd('Overline', '\%82v.\+')
augroup END

