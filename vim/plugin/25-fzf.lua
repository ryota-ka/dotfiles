vim.api.nvim_create_user_command(
  'GGrep',
  "call fzf#vim#grep('git grep --line-number -I --untracked '..shellescape(<q-args>), 0, { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)",
  {
    nargs = '*',
    bang = true,
  }
)

vim.keymap.set('n', '<Space>b', ':Buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>f', ':GFiles -co --exclude-standard<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>g', ':GGrep<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>l', ':Line<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>h', ':History<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>t', ':Tags<CR>', { noremap = true, silent = true })

vim.g.fzf_buffers_jump = 1

vim.api.nvim_create_augroup('fzf', {})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'Bufread' }, {
  group = 'filetype_detection',
  callback = function()
    vim.opt_local.suffixesadd = vim.fn.expand('%:e')
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'fzf' },
  command = 'set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler',
})
