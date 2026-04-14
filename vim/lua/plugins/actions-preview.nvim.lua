return {
  'aznhe21/actions-preview.nvim',
  dependencies = {
    { 'folke/snacks.nvim' },
  },
  keys = {
    {
      'gra',
      function()
        require('actions-preview').code_actions()
      end,
      desc = 'Code Actions (Preview)',
      mode = { 'n', 'v' },
    },
  },
  opts = {
    backend = {
      'snacks',
    },
    snacks = {
      layout = {
        preset = 'vertical',
      },
    },
  },
}
