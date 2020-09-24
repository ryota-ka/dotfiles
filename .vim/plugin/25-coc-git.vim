if HasPlugin('coc.nvim')
  nmap ]g <Plug>(coc-git-nextchunk)
  nmap [g <Plug>(coc-git-prevchunk)
  nmap gs <Plug>(coc-git-chunkinfo)
  nmap gc <Plug>(coc-git-commit)

  omap ig <Plug>(coc-git-chunk-inner)
  xmap ig <Plug>(coc-git-chunk-inner)
  omap ag <Plug>(coc-git-chunk-outer)
  xmap ag <Plug>(coc-git-chunk-outer)

  nnoremap <Leader>ga :CocCommand git.chunkStage<CR>
  nnoremap <silent> <space>g :<C-u>CocList --normal gstatus<CR>

  autocmd CursorHold * CocCommand git.refresh
endif
