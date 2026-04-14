return {
  'lewis6991/gitsigns.nvim',
  event = {
    'BufNewFile',
    'BufRead',
  },
  keys = {
    {
      '<leader>ga',
      function()
        require('gitsigns').stage_hunk()
      end,
      desc = 'Stage hunk',
    },
    {
      '<leader>ga',
      function()
        require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end,
      desc = 'Stage hunk',
      mode = 'v',
    },
    {
      '<leader>gA',
      function()
        require('gitsigns').stage_buffer()
      end,
      desc = 'Stage buffer',
    },
    {
      '<leader>gb',
      function()
        require('gitsigns').blame_line({ full = true })
      end,
      desc = 'Blame line',
    },
    {
      '<leader>gd',
      function()
        require('gitsigns').diffthis()
      end,
      desc = 'Diff this',
    },
    {
      '<leader>gD',
      function()
        require('gitsigns').diffthis('~')
      end,
      desc = 'Diff against ~',
    },
    {
      '<leader>gq',
      function()
        require('gitsigns').setqflist()
      end,
      desc = 'Populate the quickfix list with hunks (current file)',
    },
    {
      '<leader>gQ',
      function()
        require('gitsigns').setqflist('all')
      end,
      desc = 'Populate the quickfix list with hunks (all files)',
    },
    {
      '<leader>gr',
      function()
        require('gitsigns').undo_stage_hunk()
      end,
      desc = 'Reset hunk',
    },
    {
      '<leader>gs',
      function()
        require('gitsigns').preview_hunk_inline()
      end,
      desc = 'Preview hunk inline',
    },
    {
      '<leader>gu',
      function()
        require('gitsigns').reset_hunk()
      end,
      desc = 'Undo hunk',
    },
    {
      '<leader>gu',
      function()
        require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end,
      desc = 'Undo hunk',
      mode = 'v',
    },
    {
      '<leader>gU',
      function()
        require('gitsigns').reset_buffer()
      end,
      desc = 'Reset buffer',
    },
    {
      '<leader>tb',
      function()
        require('gitsigns').toggle_current_line_blame()
      end,
      desc = 'Toggle current line blame',
    },
    {
      '[g',
      function()
        if vim.wo.diff then
          return '[g'
        else
          require('gitsigns').nav_hunk('prev')
        end
      end,
      desc = 'Previous hunk',
      expr = true,
    },
    {
      '[G',
      function()
        require('gitsigns').nav_hunk('prev', { target = 'staged' })
      end,
      desc = 'Previous staged hunk',
    },
    {
      ']g',
      function()
        if vim.wo.diff then
          return ']g'
        else
          require('gitsigns').nav_hunk('next')
        end
      end,
      desc = 'Next hunk',
      expr = true,
    },
    {
      ']G',
      function()
        require('gitsigns').nav_hunk('next', { target = 'staged' })
      end,
      desc = 'Next staged hunk',
    },
    {
      'ig',
      function()
        require('gitsigns').select_hunk()
      end,
      desc = 'Select hunk',
      mode = { 'o', 'x' },
    },
  },
  opts = {
    current_line_blame_opts = {
      virt_text_pos = 'overlay',
    },
    on_attach = function()
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },
}
