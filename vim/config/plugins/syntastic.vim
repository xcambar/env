" Syntactic checks files on open
let g:syntastic_check_on_open=1

autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs'] : ['jshint']
