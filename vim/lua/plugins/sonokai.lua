return {
  'sainnhe/sonokai',
  config = function()
    vim.cmd('colorscheme sonokai')
  end,
  init = function()
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_float_style = 'dim'
    vim.g.sonokai_transparent_background = 2
  end,
  lazy = false,
  priority = 1000,
}
