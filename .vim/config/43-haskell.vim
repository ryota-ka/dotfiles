augroup haskell_configuration
  autocmd!
  autocmd BufNewFile,BufRead *.hs setlocal tabstop=4
  " Disable haskell-vim omnifunc
  let g:haskellmode_completion_ghc = 0
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

nnoremap <Leader>t :GhcModType<CR>
