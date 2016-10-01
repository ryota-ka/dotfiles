" display line number
set number

" don't give the intro message when starting Vim
set shortmess+=I

" display ^ for tabs, ~ for trailing spaces
set list
set listchars=tab:^\ ,trail:~

" always display the status line
set laststatus=2

" show command in the last line of the screen
set showcmd

" use twice the width of ASCII characters for East Asian Width characters
set ambiwidth=double

" don't redraw the screen while executing macros
set lazyredraw

" limit the maximum number of items in the popup menu for Insert mode completion
set pumheight=10
