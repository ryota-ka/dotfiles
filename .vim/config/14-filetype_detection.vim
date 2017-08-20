augroup filetype_detection
  autocmd!
  autocmd BufNewFile,BufRead *.rs set filetype=rust
  autocmd BufNewFile,BufRead *.ts set filetype=typescript
  autocmd BufNewFile,Bufread *.jbuilder set filetype=ruby
  autocmd BufNewFile,Bufread *.styl set filetype=stylus
augroup END
