augroup git_configuration
  autocmd!
  autocmd BufReadPost PULLREQ_EDITMSG setlocal ft=gitcommit
  autocmd FileType gitcommit setlocal spell
augroup END

if dein#tap('vim-gitgutter')
  nnoremap ghn :GitGutterNextHunk<CR>
  nnoremap ghp :GitGutterPrevHunk<CR>
  nnoremap ghs :GitGutterStageHunk<CR>
endif
