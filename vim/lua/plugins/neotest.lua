return {
  'nvim-neotest/neotest',
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-vitest'),
      },
      status = {
        virtual_text = true,
      },
      output = {
        open_on_run = false,
      },
    })
  end,
  dependencies = {
    { 'antoinemadec/FixCursorHold.nvim' },
    { 'marilari88/neotest-vitest' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-neotest/nvim-nio' },
    { 'nvim-treesitter/nvim-treesitter' },
  },
  keys = {
    {
      '<leader>ta',
      function()
        require('neotest').run.run(vim.uv.cwd())
      end,
      desc = 'Run All Tests',
    },
    {
      '<leader>tf',
      function()
        require('neotest').run.run(vim.fn.expand('%'))
      end,
      desc = 'Run File Tests',
    },
    {
      '<leader>to',
      function()
        require('neotest').output.open({ enter = true, auto_close = true })
      end,
      desc = 'Show Output',
    },
    {
      '<leader>tO',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'Toggle Output Panel',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle Summary',
    },
    {
      '<leader>tS',
      function()
        require('neotest').run.stop()
      end,
      desc = 'Stop Test',
    },
    {
      '<leader>tt',
      function()
        require('neotest').run.run()
      end,
      desc = 'Run Nearest Test',
    },
    {
      '<leader>tw',
      function()
        require('neotest').watch.toggle(vim.fn.expand('%'))
      end,
      desc = 'Toggle Watch',
    },
    {
      '[t',
      function()
        require('neotest').jump.prev({ status = 'failed' })
      end,
      desc = 'Previous Failed Test',
    },
    {
      ']t',
      function()
        require('neotest').jump.next({ status = 'failed' })
      end,
      desc = 'Next Failed Test',
    },
  },
}
