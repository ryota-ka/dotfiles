augroup ruby_configuration
  autocmd!
  autocmd BufNewFile,BufRead *.rb setlocal iskeyword+=@-@

  if dein#tap('vim-rspec')
   let g:rspec_command = 'Dispatch bundle exec rspec {spec}'
  endif
augroup END

let g:rsenseUseOmniFunc = 1
