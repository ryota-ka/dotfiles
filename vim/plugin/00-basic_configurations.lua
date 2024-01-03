vim.opt.fileencoding = 'utf-8'

-- save backup file
vim.opt.backup = true
vim.opt.backupdir:remove('.')

-- persistent undo
vim.opt.undofile = true

-- don't insert a whitespace on joining lines with multi-byte characters
vim.opt.formatoptions:append('mM')

-- allow virtual editing only in Visual block mode
vim.opt.virtualedit = 'block'

-- ignore case on ex-mode completion
vim.opt.wildignorecase = true

-- display only part of long lines
vim.opt.wrap = false

-- recover cursor position on opening a file
vim.api.nvim_exec(
  [[
  augroup recover_cursor_position
    autocmd!
    autocmd BufReadPost *
      \ if &filetype != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line('$') |
      \   exe "normal! g`\"" |
      \ endif
  augroup END
]],
  false
)

-- refresh screen on every 250ms
vim.opt.updatetime = 250

vim.opt.signcolumn = 'yes'

vim.opt.clipboard:append('unnamedplus')

-- reload buffer when modified outside of Vim
vim.cmd([[autocmd FocusGained,BufEnter * checktime]])
