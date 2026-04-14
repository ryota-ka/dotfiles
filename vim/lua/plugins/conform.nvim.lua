return {
  'stevearc/conform.nvim',
  cmd = {
    'ConformInfo',
  },
  event = {
    'BufWritePre',
  },
  opts = {
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    formatters_by_ft = {
      graphql = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      terraform = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
    },
  },
}
