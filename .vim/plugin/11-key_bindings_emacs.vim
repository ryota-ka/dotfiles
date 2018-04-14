nnoremap <C-a> <Home>
inoremap <C-a> <Home>
xnoremap <C-a> <Home>
cnoremap <C-a> <Home>

nnoremap <C-e> <End>
inoremap <C-e> <End>
xnoremap <C-e> <End>
cnoremap <C-e> <End>

inoremap <C-b> <C-g>U<Left>
xnoremap <C-b> <Left>
cnoremap <C-b> <Left>

inoremap <C-f> <C-g>U<Right>
xnoremap <C-f> <Right>
cnoremap <C-f> <Right>

inoremap <C-k> <C-r>=<SID>kill_line()<CR>

inoremap <C-h> <BS>
cnoremap <C-h> <BS>


function! s:kill_line()
  let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! s:split_line_text_at_cursor()
  let line_text = getline(line('.'))
  let text_after_cursor  = line_text[col('.')-1 :]
  let text_before_cursor = (col('.') > 1) ? line_text[: col('.') - 2] : ''
  return [text_before_cursor, text_after_cursor]
endfunction
