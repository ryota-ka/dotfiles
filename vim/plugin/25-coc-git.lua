if require('has_plugin')('coc.nvim') then
  vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-git-nextchunk)', { silent = true })
  vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-git-prevchunk)', { silent = true })
  vim.api.nvim_set_keymap('n', 'gs', '<Plug>(coc-git-chunkinfo)', { silent = true })
  vim.api.nvim_set_keymap('n', 'gc', '<Plug>(coc-git-commit)', { silent = true })

  vim.api.nvim_set_keymap('o', 'ig', '<Plug>(coc-git-chunk-inner)', { silent = true })
  vim.api.nvim_set_keymap('x', 'ig', '<Plug>(coc-git-chunk-inner)', { silent = true })
  vim.api.nvim_set_keymap('o', 'ag', '<Plug>(coc-git-chunk-outer)', { silent = true })
  vim.api.nvim_set_keymap('x', 'ag', '<Plug>(coc-git-chunk-outer)', { silent = true })

  vim.api.nvim_set_keymap('n', '<Leader>ga', ':CocCommand git.chunkStage<CR>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<space>g', ':<C-u>CocList --normal gstatus<CR>', { silent = true })

  vim.api.nvim_create_autocmd('CursorHold', {
    command = 'CocCommand git.refresh',
  })
end
