" turn off Vi-compatible behavior
if &compatible
  set nocompatible
endif

" set the character encoding used inside Vim
set encoding=utf-8

" try to open a file with the following encodings
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,latin1

" save backup file in ~/.vim/backup
set backup
set backupdir=$HOME/.vim/backup

" persistent undo
if version >= 703
  set undofile
  set undodir=$HOME/.vim/undo
endif

" don't consider octal numbers when using the C-a / C-x command
set nrformats-=octal

" a buffer becomes hidden when it is abandoned
set hidden

" don't insert a whitespace on joining lines with multi-byte characters
set formatoptions+=mM

" allow virtual editing only in Visual block mode
set virtualedit=block

" allow backspacing over auto indent and the start of insert
set backspace=eol,indent,start

" use enhanced command-line completion
set wildmenu wildmode=full

" automatically reload file when it is detected to have been changed outside of Vim
set autoread

" display only part of long lines
set nowrap

" set the number of history lines that are remembered
set history=2000

" recover cursor position on opening a file
augroup recover_cursor_position
  autocmd!
  autocmd BufReadPost *
    \ if &filetype != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END
