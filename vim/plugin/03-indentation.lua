-- Number of spaces that a tab in the file counts for
vim.opt.tabstop = 2

-- Number of spaces to use for each step if (auto)indent
vim.opt.shiftwidth = 2

-- Insert spaces instead of a tab
vim.opt.expandtab = true

-- Do smart auto-indenting when starting a new line
vim.opt.smartindent = true

-- Fire indentation on pressing tab key
vim.opt.indentkeys:append('!<Tab>')
