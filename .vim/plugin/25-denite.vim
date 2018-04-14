nnoremap <silent> <Space>h :<C-u>Denite file_old
      \ -auto-preview
      \ -buffer-name=oldfile
      \ -vertical-preview
      \ <CR>

nnoremap <silent> <Space>o :<C-u>Denite outline
      \ -auto-preview
      \ -buffer-name=outline
      \ -vertical-preview
      \ <CR>

nnoremap <silent> <Space>r :<C-u>Denite register
      \ -buffer-name=register
      \<CR>

nnoremap <silent> <Space>t :<C-u>Denite tag
      \ -auto-preview
      \ -vertical-preview
      \ <CR>

call denite#custom#option('_', 'split', 'tab')
call denite#custom#option('_', 'prompt', '>')
call denite#custom#option('_', 'highlight_mode_insert', 'WildMenu')
call denite#custom#option('_', 'highlight_matched_char', 'DeniteMatchedChar')
call denite#custom#option('_', 'highlight_matched_range', 'Normal')

highlight DeniteMatchedChar ctermfg=white

" custom key mappings
call denite#custom#map('normal', 'M', '<denite:move_to_middle>', 'noremap')
call denite#custom#map('normal', 's', '<denite:do_action:splitswitch>', 'noremap')
call denite#custom#map('normal', 'v', '<denite:do_action:vsplitswitch>', 'noremap')
call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-a>', '<Home>')
call denite#custom#map('insert', '<C-b>', '<Left>')
call denite#custom#map('insert', '<C-e>', '<End>')
call denite#custom#map('insert', '<C-f>', '<Right>')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-s>', '<denite:do_action:splitswitch>', 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplitswitch>', 'noremap')

" file_rec/git using git-ls-files
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

" grep/git using git-grep
call denite#custom#alias('source', 'grep/git', 'grep')
call denite#custom#var('grep/git', 'command', ['git', 'grep', '-I', '--untracked'])
call denite#custom#var('grep/git', 'recursive_opts', [])

function! WithGit(source)
  if finddir('.git', ';') != ''
    return a:source . '/git'
  else
    return a:source
  endif
endfunction