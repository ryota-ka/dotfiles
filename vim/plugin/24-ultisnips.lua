if require('has_plugin')('ultisnips') then
  -- The default value is <tab>, which conflicts with coc.nvim
  vim.g.UltiSnipsExpandTrigger = '<leader>s'
end
