return {
  'folke/todo-comments.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  event = {
    'BufNewFile',
    'BufReadPost',
  },
  keys = {
    {
      '<leader>sT',
      '<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>',
      desc = 'Todo/Fix/Fixme (Trouble)',
    },
    {
      '<leader>st',
      '<cmd>Trouble todo toggle<cr>',
      desc = 'Todo (Trouble)',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous Todo Comment',
    },
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next Todo Comment',
    },
  },
  opts = {},
}
