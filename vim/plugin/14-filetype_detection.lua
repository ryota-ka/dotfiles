vim.api.nvim_create_augroup('filetype_detection', {})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'Bufread' }, {
  group = 'filetype_detection',
  callback = function()
    vim.opt_local.suffixesadd = vim.fn.expand('%:e')
  end,
})
