hi _xc_OverLineStart ctermbg=196
hi _xc_OverLine term=bold,underline cterm=bold,underline ctermbg=18

let g:mc_patterns = [{
    \ 'off_buftypes': ['quickfix', 'help'],
    \ 'match_setup': {
      \ '*': {
        \ 'permanent': [
          \ ['_xc_OverLineStart', '\%81v.', -70],
          \ ['_xc_OverLine', '\%82v.\+', -70],
        \ ],
      \ },
    \ },
\ },]

" TODO Implement the following config format
" let g:mc_patterns = [{
"   \ 'buftypes': ['*', '!quickfix', '!help']],
"   \ 'permanent': [
"     \ ['_xc_OverLineStart', '\%81v.', -70],
"     \ ['_xc_OverLine', '\%82v.\+', -70],
"   \ ],
" \ },]
