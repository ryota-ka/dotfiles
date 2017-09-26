" ignore cases
set ignorecase

" do not ignore cases when the query includes both small and capital letters
set smartcase

" search wrap around the end of the file
set wrapscan

" enable incremental search
set incsearch

" highlight matches
set hlsearch

if has('nvim')
  set inccommand=split
endif

nnoremap <silent> n n:call BlinkNextMatch()<CR>
nnoremap <silent> N N:call BlinkNextMatch()<CR>

function! BlinkNextMatch() abort
  highlight JustMatched ctermfg=white ctermbg=magenta cterm=bold

  let pat = '\c\%#' . @/
  let id = matchadd('JustMatched', pat)
  redraw

  exec 'sleep 150m'
  call matchdelete(id)
  redraw
endfunction
