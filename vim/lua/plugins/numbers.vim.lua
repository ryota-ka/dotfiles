return {
  'myusuf3/numbers.vim',
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  init = function()
    vim.g.numbers_exclude = {
      '',
      'nofile',
      'noice',
      'snacks_dashboard',
      'snacks_picker_list',
      'snacks_picker_preview',
    }
  end,
}
