local color = require('utils.color')
local palette = color.palette

vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = palette.orange[1] })
vim.api.nvim_set_hl(0, 'CursorLineSign', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'Search', { underline = true })
vim.api.nvim_set_hl(0, 'StatusLine', { link = 'WinSeparator' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'StatusLine' })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = palette.bg4[1] })
