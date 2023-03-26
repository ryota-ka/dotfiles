if require('has_plugin')('lightline.vim') then
  vim.opt.showmode = false

  vim.g.lightline = {
    colorscheme = 'solarized',
  }
end
