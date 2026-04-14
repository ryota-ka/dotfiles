return {
  'NeogitOrg/neogit',
  cmd = 'Neogit',
  dependencies = {
    {
      'folke/snacks.nvim',
    }, -- optional
    {
      'nvim-lua/plenary.nvim',
    },
    {
      'sindrets/diffview.nvim',
    },
  },
  keys = {
    {
      '<leader>gc',
      function()
        require('neogit').open({ 'commit', kind = 'floating' })
      end,
      desc = 'Neogit Commit',
    },
    {
      '<leader>gg',
      function()
        require('neogit').open({ kind = 'floating' })
      end,
      desc = 'Neogit',
    },
  },
  opts = {
    integrations = {
      diffview = true,
    },
  },
}
