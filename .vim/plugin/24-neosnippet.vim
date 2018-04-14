if HasPlugin('neosnippet.vim')
  imap <C-x><C-x> <Plug>(neosnippet_expand)
  imap <C-x><C-j> <Plug>(neosnippet_jump)

  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif
endif
