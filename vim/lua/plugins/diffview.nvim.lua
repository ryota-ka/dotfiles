return {
  'sindrets/diffview.nvim',
  cmd = {
    'DiffviewClose',
    'DiffviewFileHistory',
    'DiffviewFocusFiles',
    'DiffviewOpen',
    'DiffviewToggleFiles',
  },
  keys = {
    {
      '<leader>gh',
      '<Cmd>DiffviewFileHistory %<CR>',
      desc = 'Diffview File History',
    },
    {
      '<leader>gH',
      '<Cmd>DiffviewFileHistory<CR>',
      desc = 'Diffview Branch History',
    },
    {
      '<leader>gv',
      '<Cmd>DiffviewOpen<CR>',
      desc = 'Diffview Open',
    },
  },
  opts = {},
}
