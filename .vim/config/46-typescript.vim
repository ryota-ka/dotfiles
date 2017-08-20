augroup typescript_configuration
  autocmd!
  autocmd FileType typescript setlocal path+=$PWD/node_modules
  autocmd FileType typescript setlocal suffixesadd+=.js,.d.ts
  autocmd FileType typescript setlocal dictionary+=~/.vim/dict/javascript.dict
  nmap tsi <Plug>(TsuquyomiImport)
  let g:tsuquyomi_completion_detail = 1
  let g:tsuquyomi_single_quote_import = 1
augroup END
