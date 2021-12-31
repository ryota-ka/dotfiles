augroup filetype_detection
  autocmd BufNewFile,Bufread * execute "setlocal suffixesadd=." . expand('%:e')
augroup END
