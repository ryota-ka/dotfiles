if HasPlugin('fzf.vim')
  command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number -I --untracked '.shellescape(<q-args>), 0,
    \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

  nnoremap <silent> <Space>b :Buffers<CR>
  nnoremap <silent> <Space>f :GFiles -co --exclude-standard<CR>
  nnoremap <silent> <Space>g :GGrep<CR>
  nnoremap <silent> <Space>l :Line<CR>
  nnoremap <silent> <Space>h :History<CR>
  nnoremap <silent> <Space>t :Tags<CR>

  let g:fzf_buffers_jump = 1

  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \ | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif
