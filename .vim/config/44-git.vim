augroup git_configuration
  autocmd!
  autocmd BufReadPost PULLREQ_EDITMSG setlocal ft=gitcommit
augroup END
