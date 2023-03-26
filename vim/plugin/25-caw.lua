if require('has_plugin')('caw.vim') then
  vim.keymap.set('n', '<Leader>c', '<Plug>(caw:hatpos:toggle)')
  vim.keymap.set('v', '<Leader>c', '<Plug>(caw:hatpos:toggle)')
end
