return {
  'folke/flash.nvim',
  event = {
    'VeryLazy',
  },
  keys = {
    {
      '+',
      function()
        require('flash').treesitter({
          actions = {
            ['+'] = 'next',
            ['-'] = 'prev',
          },
        })
      end,
      desc = 'Incremental selection',
      mode = { 'n', 'o', 'x' },
    },
    {
      '<C-s>',
      function()
        require('flash').toggle()
      end,
      desc = 'Toggle Flash Search',
      mode = { 'c' },
    },
    {
      'r',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
      mode = 'o',
    },
    {
      'R',
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Treesitter Search',
      mode = { 'o', 'x' },
    },
    {
      's',
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
      mode = { 'n', 'o', 'x' },
    },
  },
  opts = {},
}
