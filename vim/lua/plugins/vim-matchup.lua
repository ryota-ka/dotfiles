return {
  'andymass/vim-matchup',
  event = {
    'BufNewFile',
    'BufReadPost',
  },
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
  end,
}
