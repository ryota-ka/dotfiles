augroup VimQuickrun
  autocmd!
augroup END

if dein#tap('vim-quickrun')
  function! s:quickrun_on_source() abort
    let g:quickrun_config = {
        \   "_" : {
        \       "runner" : "vimproc",
        \       "runner/vimproc/updatetime" : 60
        \   },
        \   "c": {
        \      "cmdopt" : "-std=c99"
        \   }
        \}
  endfunction
  execute 'autocmd VimQuickrun User' 'dein#source#'.g:dein#name
        \ 'call s:quickrun_on_source()'
endif
