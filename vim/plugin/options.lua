vim.opt.backup = true
vim.opt.backupdir:remove('.')
vim.opt.clipboard:append('unnamedplus')
vim.opt.cmdheight = 0
vim.opt.fileencoding = 'utf-8'
vim.opt.fillchars = { eob = ' ', horiz = '─', stl = '─' }
vim.opt.foldenable = false
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.opt.formatoptions:append('mM')
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.mousemodel = 'extend'
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.statusline = "%{repeat('─', winwidth(0) + 1)}"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.virtualedit = 'block'
vim.opt.wildignorecase = true
vim.opt.wildmode = { 'longest', 'list' }
vim.opt.winblend = 10
vim.opt.wrap = false
