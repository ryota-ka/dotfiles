return {
  'github/copilot.vim',
  event = {
    'VeryLazy',
  },
  init = function()
    vim.g.copilot_filetypes = {
      gitcommit = true,
      markdown = true,
    }
  end,
}
