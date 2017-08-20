nnoremap [denite] <Nop>
nmap <Space> [denite]

nnoremap <silent> [denite]b :<C-u>Denite buffer
      \ -buffer-name=buffer
      \ -resume
      \ <CR>

nnoremap <silent> [denite]f :<C-u>DeniteProjectDir `WithGit('file_rec')`
      \ -auto-preview
      \ -buffer-name=files
      \ -default-action=tabswitch
      \ -resume
      \ <CR>

nnoremap <silent> [denite]g :<C-u>DeniteProjectDir `WithGit('grep')`
      \ -auto-preview
      \ -buffer-name=grep
      \ -default-action=tabswitch
      \ <CR>

nnoremap <silent> [denite]h :<C-u>Denite file_old
      \ -auto-preview
      \ -buffer-name=oldfile
      \ -default-action=tabswitch
      \ -resume
      \ <CR>

nnoremap <silent> [denite]l :<C-u>Denite line
      \ -auto-preview
      \ -buffer-name=line
      \ <CR>

nnoremap <silent> [denite]o :<C-u>Denite outline
      \ -auto-preview
      \ -buffer-name=outline
      \ -resume
      \ <CR>

nnoremap <silent> [denite]r :<C-u>Denite register
      \ -buffer-name=register
      \<CR>

nnoremap <silent> [denite]t :<C-u>Denite tag
      \ -auto-preview
      \ -default-action=tabswitch
      \ <CR>

call denite#custom#option('_', 'split', 'tab')

" custom key mappings
call denite#custom#map('normal', 'M', '<denite:move_to_middle>', 'noremap')
call denite#custom#map('normal', 's', '<denite:do_action:splitswitch>', 'noremap')
call denite#custom#map('normal', 'v', '<denite:do_action:vsplitswitch>', 'noremap')
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
call denite#custom#var('grep/git', 'command', ['git', 'grep'])
call denite#custom#var('grep/git', 'recursive_opts', [])

function! WithGit(source)
  if finddir('.git', ';') != ''
    return a:source . '/git'
  else
    return a:source
  endif
endfunction
