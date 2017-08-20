inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <silent> <CR> <C-r>=<SID>cr()<CR>
function! s:cr()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

if dein#tap('deoplete.nvim') && has('nvim')
  let g:deoplete#auto_complete_start_length = 1
  let g:deoplete#auto_refresh_delay = 250
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_auto_select = 0
  let g:deoplete#max_list = 10

  if !exists('g:deoplete#keyword_patterns')
      let g:deoplete#keyword_patterns = {}
  endif
  let g:deoplete#keyword_patterns['default'] = '\h\w*'

  inoremap <expr><C-g> deoplete#undo_completion()
  inoremap <expr><C-l> deoplete#complete_common_string()

  inoremap <expr><C-h> deoplete#smart_close_popup() . "\<C-h>"
  inoremap <expr><BS> deoplete#smart_close_popup() . "\<C-h>"

  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif
