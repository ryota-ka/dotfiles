augroup javascript_configuration
  autocmd!
  autocmd FileType javascript setlocal path+=$PWD/node_modules
  autocmd FileType javascript setlocal dictionary+=~/.vim/dict/javascript.dict
augroup END
