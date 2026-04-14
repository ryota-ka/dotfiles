local color = require('utils.color')
local palette = color.palette

local function line_bg(key)
  return color.alpha_blend(palette[key][1], palette.bg0[1], 0.1)
end

vim.api.nvim_set_hl(0, 'DiagnosticLineError', { bg = line_bg('red') })
vim.api.nvim_set_hl(0, 'DiagnosticLineWarn', { bg = line_bg('yellow') })
vim.api.nvim_set_hl(0, 'DiagnosticLineInfo', { bg = line_bg('blue') })
vim.api.nvim_set_hl(0, 'DiagnosticLineHint', { bg = line_bg('green') })

vim.diagnostic.config({
  float = true,
  jump = {
    float = true,
    severity = {
      vim.diagnostic.severity.ERROR,
      vim.diagnostic.severity.WARN,
    },
  },
  severity_sort = true,
  signs = {
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticLineError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticLineWarn',
      [vim.diagnostic.severity.INFO] = 'DiagnosticLineInfo',
      [vim.diagnostic.severity.HINT] = 'DiagnosticLineHint',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorFloat',
      [vim.diagnostic.severity.WARN] = 'WarningFloat',
    },
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
  virtual_text = true,
})
