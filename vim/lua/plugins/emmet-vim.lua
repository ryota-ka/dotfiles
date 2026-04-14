return {
  'mattn/emmet-vim',
  ft = {
    'html',
    'typescript.tsx',
  },
  init = function()
    vim.g.user_emmet_settings = {
      typescript = {
        extends = 'jsx',
      },
    }
  end,
}
