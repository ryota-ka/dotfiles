vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeFind<CR>', { silent = true })

vim.api.nvim_create_augroup('nerdtree', {})
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  group = 'nerdtree',
  callback = function()
    -- if vim.fn.winnr('$') == 1 and vim.fn.exists('b:NERDTree') and vim.b.
    -- -- if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  end,
})

vim.g.NERDTreeIndicatorMapCustom = {
  Modified = 'M',
  Staged = 'A',
  Untracked = '?',
  Renamed = 'R',
  Unmerged = '-',
  Deleted = 'D',
  Dirty = '-',
  Clean = '-',
  Ignored = '!',
  Unknown = '?',
}
