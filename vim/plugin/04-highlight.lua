local configuration = vim.api.nvim_call_function('sonokai#get_configuration', {})
local palette = vim.api.nvim_call_function('sonokai#get_palette', { configuration.style, configuration.colors_override })

vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = palette.orange[1] })
vim.api.nvim_set_hl(0, 'Search', { underline = true })
vim.api.nvim_set_hl(0, 'StatusLine', { link = 'WinSeparator' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'StatusLine' })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = palette.bg4[1] })
