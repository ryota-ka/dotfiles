let s:bundle = neobundle#get("vim-quickrun")
function! s:bundle.hooks.on_source(bundle)
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
