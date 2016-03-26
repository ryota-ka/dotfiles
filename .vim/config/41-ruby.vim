augroup ruby_configuration
  autocmd!
  autocmd BufNewFile,BufRead *.rb setlocal iskeyword+=@-@
  autocmd BufNewFile,Bufread *.jbuilder,Bowerfile,Guardfile set filetype=ruby
augroup END
