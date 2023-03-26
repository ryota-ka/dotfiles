vim.api.nvim_set_keymap('n', '<C-a>', '<Home>', {})
vim.api.nvim_set_keymap('i', '<C-a>', '<Home>', {})
vim.api.nvim_set_keymap('x', '<C-a>', '<Home>', {})
vim.api.nvim_set_keymap('c', '<C-a>', '<Home>', {})

vim.api.nvim_set_keymap('n', '<C-e>', '<End>', {})
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', {})
vim.api.nvim_set_keymap('x', '<C-e>', '<End>', {})
vim.api.nvim_set_keymap('c', '<C-e>', '<End>', {})

vim.api.nvim_set_keymap('i', '<C-b>', '<C-g>U<Left>', {})
vim.api.nvim_set_keymap('x', '<C-b>', '<Left>', {})
vim.api.nvim_set_keymap('c', '<C-b>', '<Left>', {})

vim.api.nvim_set_keymap('i', '<C-f>', '<C-g>U<Right>', {})
vim.api.nvim_set_keymap('x', '<C-f>', '<Right>', {})
vim.api.nvim_set_keymap('c', '<C-f>', '<Right>', {})

vim.api.nvim_set_keymap('i', '<C-h>', '<BS>', {})
vim.api.nvim_set_keymap('c', '<C-h>', '<BS>', {})
