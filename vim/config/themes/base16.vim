let base16colorspace=256
set t_Co=256
let mode=$BASE16_MODE
colorscheme base16-ocean

if mode == 'light'
  set background=light
else
  set background=dark
endif
