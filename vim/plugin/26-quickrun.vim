augroup VimQuickrun
  autocmd!
augroup END

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
