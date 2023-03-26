vim.api.nvim_set_keymap('n', 'h', '<Left>zv', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'l', '<Right>zv', { noremap = true })

vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-]>', 'g<C-]>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { silent = true })

vim.api.nvim_set_keymap('c', '<C-n>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-p>', '<Up>', { noremap = true })
