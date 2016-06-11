augroup git_configuration
  autocmd!
  autocmd BufReadPost PULLREQ_EDITMSG setlocal ft=gitcommit
  autocmd FileType gitcommit setlocal spell
augroup END
