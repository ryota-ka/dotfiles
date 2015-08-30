let s:bundle = neobundle#get("neosnippet.vim")
function! s:bundle.hooks.on_source(bundle)
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
endfunction
