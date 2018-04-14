augroup typescript_configuration
  autocmd!
  autocmd FileType typescript setlocal path+=$PWD/node_modules
  autocmd FileType typescript setlocal suffixesadd+=.js,.d.ts
  autocmd FileType typescript setlocal dictionary+=~/.vim/dict/javascript.dict
augroup END
