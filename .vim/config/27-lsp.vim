if dein#tap('LanguageClient-neovim')
  let g:LanguageClient_serverCommands = {
      \ 'typescript': ['javascript-typescript-stdio'],
      \ }

  autocmd FileType typescript LanguageClientStart

  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

  set omnifunc=LanguageClient#complete

  if !exists('g:deoplete#omni#functions')
    let g:deoplete#omni#functions = {}
  endif

  let g:deoplete#omni#functions.typescript = 'LanguageClient#complete'
endif
