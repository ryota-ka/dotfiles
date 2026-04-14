return {
  'Wansmer/treesj',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  keys = {
    {
      'gJ',
      function()
        require('treesj').join()
      end,
      desc = 'Join lines',
    },
    {
      'gS',
      function()
        require('treesj').split()
      end,
      desc = 'Split lines',
    },
  },
  opts = {},
}
