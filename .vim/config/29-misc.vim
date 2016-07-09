if dein#tap('caw.vim')
  nmap <Leader>c <Plug>(caw:i:toggle)
  vmap <Leader>c <Plug>(caw:i:toggle)
endif

if dein#tap('vim-parenmatch')
  let g:loaded_matchparen = 1
endif
