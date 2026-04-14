return {
  'romgrk/barbar.nvim',
  config = function(_, opts)
    require('barbar').setup(opts)

    vim.api.nvim_set_hl(0, 'BufferAlternate', { link = 'BufferInactive' })
    vim.api.nvim_set_hl(0, 'BufferAlternateADDED', { link = 'BufferInactiveADDED' })
    vim.api.nvim_set_hl(0, 'BufferAlternateBtn', { link = 'BufferInactiveBtn' })
    vim.api.nvim_set_hl(0, 'BufferAlternateCHANGED', { link = 'BufferInactiveCHANGED' })
    vim.api.nvim_set_hl(0, 'BufferAlternateDELETED', { link = 'BufferInactiveDELETED' })
    vim.api.nvim_set_hl(0, 'BufferAlternateERROR', { link = 'BufferInactiveERROR' })
    vim.api.nvim_set_hl(0, 'BufferAlternateHINT', { link = 'BufferInactiveHINT' })
    vim.api.nvim_set_hl(0, 'BufferAlternateIcon', { link = 'BufferInactiveIcon' })
    vim.api.nvim_set_hl(0, 'BufferAlternateIndex', { link = 'BufferInactiveIndex' })
    vim.api.nvim_set_hl(0, 'BufferAlternateINFO', { link = 'BufferInactiveINFO' })
    vim.api.nvim_set_hl(0, 'BufferAlternateMod', { link = 'BufferInactiveMod' })
    vim.api.nvim_set_hl(0, 'BufferAlternateModBtn', { link = 'BufferInactiveModBtn' })
    vim.api.nvim_set_hl(0, 'BufferAlternateNumber', { link = 'BufferInactiveNumber' })
    vim.api.nvim_set_hl(0, 'BufferAlternatePin', { link = 'BufferInactivePin' })
    vim.api.nvim_set_hl(0, 'BufferAlternatePinBtn', { link = 'BufferInactivePinBtn' })
    vim.api.nvim_set_hl(0, 'BufferAlternateSignRight', { link = 'BufferInactiveSignRight' })
    vim.api.nvim_set_hl(0, 'BufferAlternateTarget', { link = 'BufferInactiveTarget' })
    vim.api.nvim_set_hl(0, 'BufferAlternateWARN', { link = 'BufferInactiveWARN' })

    local color = require('utils.color')

    local current = vim.api.nvim_get_hl(0, { name = 'BufferCurrent' })
    local inactive = vim.api.nvim_get_hl(0, { name = 'BufferInactive' })

    local error = vim.api.nvim_get_hl(0, { name = 'DiagnosticError' })
    vim.api.nvim_set_hl(0, 'BufferCurrentERROR', { fg = error.fg, bg = current.bg })
    vim.api.nvim_set_hl(0, 'BufferInactiveERROR', { fg = error.fg, bg = inactive.bg })

    local warn = vim.api.nvim_get_hl(0, { name = 'DiagnosticWarn' })
    vim.api.nvim_set_hl(0, 'BufferCurrentWARN', { fg = warn.fg, bg = current.bg })
    vim.api.nvim_set_hl(0, 'BufferInactiveWARN', { fg = warn.fg, bg = inactive.bg })

    local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
    vim.api.nvim_set_hl(0, 'BufferCurrentSign', { fg = color.palette.orange[1], bg = current.bg })
    vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { link = 'BufferCurrentSign' })
    vim.api.nvim_set_hl(0, 'BufferAlternateSign', { fg = normal.fg, bg = inactive.bg })
    vim.api.nvim_set_hl(0, 'BufferInactiveIndex', { fg = normal.fg, bg = inactive.bg })
  end,
  dependencies = {
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
  },
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  keys = {
    {
      '<Leader>bd',
      '<Cmd>BufferClose<CR>',
      desc = 'Close Buffer',
    },
    {
      '<M-0>',
      '<Cmd>BufferLast<CR>',
      desc = 'Go to Last Buffer',
    },
    {
      '<M-1>',
      '<Cmd>BufferGoto 1<CR>',
      desc = 'Go to Buffer 1',
    },
    {
      '<M-2>',
      '<Cmd>BufferGoto 2<CR>',
      desc = 'Go to Buffer 2',
    },
    {
      '<M-3>',
      '<Cmd>BufferGoto 3<CR>',
      desc = 'Go to Buffer 3',
    },
    {
      '<M-4>',
      '<Cmd>BufferGoto 4<CR>',
      desc = 'Go to Buffer 4',
    },
    {
      '<M-5>',
      '<Cmd>BufferGoto 5<CR>',
      desc = 'Go to Buffer 5',
    },
    {
      '<M-6>',
      '<Cmd>BufferGoto 6<CR>',
      desc = 'Go to Buffer 6',
    },
    {
      '<M-7>',
      '<Cmd>BufferGoto 7<CR>',
      desc = 'Go to Buffer 7',
    },
    {
      '<M-8>',
      '<Cmd>BufferGoto 8<CR>',
      desc = 'Go to Buffer 8',
    },
    {
      '<M-9>',
      '<Cmd>BufferGoto 9<CR>',
      desc = 'Go to Buffer 9',
    },
    {
      '[b',
      '<Cmd>BufferPrevious<CR>',
      desc = 'Previous Buffer',
    },
    {
      ']b',
      '<Cmd>BufferNext<CR>',
      desc = 'Next Buffer',
    },
  },
  opts = {
    animation = false,
    highlight_alternate = true,
    icons = {
      buffer_index = 'superscript',
      diagnostics = {
        { enabled = true },
        { enabled = true },
      },
      gitsigns = {
        added = { enabled = true, icon = '+' },
        changed = { enabled = true, icon = '~' },
        deleted = { enabled = true, icon = '-' },
      },
    },
  },
}
