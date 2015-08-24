" display line number
set number

" don't give the intro message when starting Vim
set shortmess+=I

" highlight the screen line of the cursor
set cursorline

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