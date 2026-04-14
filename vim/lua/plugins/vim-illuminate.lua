return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      filetypes_denylist = {
        'gitcommit',
        'markdown',
      },
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
    })
  end,
  event = {
    'BufNewFile',
    'BufReadPost',
  },
}
