"spezifika für gvim. rest kommt über .vim/vimrc


" #### colorschemes ####

"colorscheme hbpeachpuff
"colorscheme hb_warm_grey
"colorscheme hb_two2tango

set background=dark
colorscheme solarized

"solarized
let g:solarized_contrast='high'
let g:solarized_visibility='high'



" ##### fonts! #############
"set guifont=Courier\ 10\ Pitch\ 11
set guifont=Liberation\ Mono\ 10
"set guifont=Droid\ Sans\ Mono\ 10
"set guifont=Inconsolata-g\ 10
"set guifont=Source\ Code\ Pro\ Regular\ 10
"set guifont=Anonymous\ Pro\ 11


" eigentlich ein hack. Warum übernimmt gvim nicht die
" Terminaleinstellung?
set encoding=utf-8

"gui ohne toolbar
set guioptions-=T

"gui ohne menue:
"set guioptions-=m

source ~/.vim/vimrc

