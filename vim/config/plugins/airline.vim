let g:airline_powerline_fonts = 1
set laststatus=2

let g:airline_section_b = '%{expand("%:h")}'
let g:airline_section_c = "%<%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"
let g:airline_section_x = "%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}"
let g:airline_section_y = "%{airline#util#wrap(airline#parts#filetype(),0)}"
let g:airline_section_z = "%{airline#util#wrap(airline#extensions#branch#get_head(),0)}"

let g:airline#extensions#default#section_truncate_width = { 'b':85, 'x':60, 'y':88, 'z':45, }
