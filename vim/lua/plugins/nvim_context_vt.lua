return {
  'andersevenrud/nvim_context_vt',
  config = function()
    vim.api.nvim_set_hl(0, 'ContextVt', { fg = '#555555' })

    require('nvim_context_vt').setup({})
  end,
  event = {
    'BufNewFile',
    'BufReadPost',
  },
}
