-- turn off Vi-compatible behavior
if vim.opt.compatible then
  vim.opt.compatible = false
end

vim.opt.fileencoding = 'utf-8'

-- save backup file
vim.opt.backup = true
vim.opt.backupdir:remove('.')

-- persistent undo
vim.opt.undofile = true

-- don't consider octal numbers when using the C-a / C-x command
vim.opt.nrformats:remove('octal')

-- a buffer becomes hidden when it is abandoned
vim.opt.hidden = true

-- don't insert a whitespace on joining lines with multi-byte characters
vim.opt.formatoptions:append('mM')

-- allow virtual editing only in Visual block mode
vim.opt.virtualedit = 'block'

-- allow backspacing over auto indent and the start of insert
vim.opt.backspace = 'eol,indent,start'

-- use enhanced command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = 'full'

-- ignore case on ex-mode completion
vim.opt.wildignorecase = true

-- display only part of long lines
vim.opt.wrap = false

-- set the number of history lines that are remembered
vim.opt.history = 2000

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

if vim.fn.has('mouse') == 1 then
  vim.o.mouse = 'a'
end

-- reload buffer when modified outside of Vim
vim.cmd([[autocmd FocusGained,BufEnter * checktime]])
