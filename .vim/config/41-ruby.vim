augroup ruby_configuration
  autocmd!
  autocmd BufNewFile,BufRead *.rb setlocal iskeyword+=@-@
  autocmd BufNewFile,Bufread *.jbuilder,Bowerfile,Guardfile set filetype=ruby

  if dein#tap('vim-rspec')
   let g:rspec_command = 'Dispatch bundle exec rspec {spec}'
  endif
augroup END
