-- display line number
vim.opt.number = true

-- don't give the intro message when starting Vim
vim.opt.shortmess:append('I')

vim.opt.list = true

-- use twice the width of ASCII characters for East Asian Width characters
vim.opt.ambiwidth = 'double'

-- don't redraw the screen while executing macros
vim.opt.lazyredraw = true

-- limit the maximum number of items in the popup menu for Insert mode completion
vim.opt.pumheight = 10
