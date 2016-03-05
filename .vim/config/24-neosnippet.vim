if dein#tap('neosnippet.vim')
  function! s:neosnippet_on_source() abort
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
  endfunction
endif
