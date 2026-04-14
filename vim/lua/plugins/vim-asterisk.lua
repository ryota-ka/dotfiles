return {
  'haya14busa/vim-asterisk',
  keys = {
    {
      '#',
      '<Plug>(asterisk-z#)',
      desc = 'Search word under cursor backwards (stay)',
      remap = true,
    },
    {
      '*',
      '<Plug>(asterisk-z*)',
      desc = 'Search word under cursor (stay)',
      remap = true,
    },
    {
      'g#',
      '<Plug>(asterisk-gz#)',
      desc = 'Search partial word backwards (stay)',
      remap = true,
    },
    {
      'g*',
      '<Plug>(asterisk-gz*)',
      desc = 'Search partial word (stay)',
      remap = true,
    },
  },
}
