noremap  <C-a> <Home>
inoremap <C-a> <Home>
xnoremap <C-a> <Home>
cnoremap <C-a> <Home>

noremap  <C-e> <End>
inoremap <C-e> <End>
xnoremap <C-e> <End>
cnoremap <C-e> <End>

nnoremap <C-b> <Left>
inoremap <C-b> <C-g>U<Left>
xnoremap <C-b> <Left>
cnoremap <C-b> <Left>

nnoremap <C-f> <Right>
inoremap <C-f> <C-g>U<Right>
xnoremap <C-f> <Right>
cnoremap <C-f> <Right>

nnoremap <C-n> <Down>
inoremap <C-n> <Down>
xnoremap <C-n> <Down>

nnoremap <C-p> <Up>
inoremap <C-p> <UP>
xnoremap <C-p> <UP>

nnoremap <C-k> D
inoremap <C-k> <C-r>=<SID>kill_line()<CR>

inoremap <C-h> <BS>
cnoremap <C-h> <BS>

inoremap <C-d> <delete>
cnoremap <C-d> <Del>

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
