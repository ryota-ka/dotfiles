return {
  'ysmb-wtsg/in-and-out.nvim',
  keys = {
    {
      '<C-CR>',
      function()
        require('in-and-out').in_and_out()
      end,
      desc = 'Jump out of surrounding characters',
      mode = 'i',
    },
  },
}
