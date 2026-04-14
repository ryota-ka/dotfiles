return {
  'folke/sidekick.nvim',
  event = {
    'BufReadPost',
  },
  keys = {
    {
      '<C-.>',
      function()
        require('sidekick.cli').toggle()
      end,
      desc = 'Sidekick Toggle',
      mode = { 'i', 'n', 't', 'x' },
    },
    {
      '<Tab>',
      function()
        if not require('sidekick').nes_jump_or_apply() then
          return '<Tab>'
        end
      end,
      desc = 'Goto/Apply Next Edit Suggestion',
      expr = true,
    },
    {
      '<leader>aa',
      function()
        require('sidekick.cli').toggle()
      end,
      desc = 'Toggle CLI',
    },
    {
      '<leader>ad',
      function()
        require('sidekick.cli').close()
      end,
      desc = 'Detach a CLI Session',
    },
    {
      '<leader>af',
      function()
        require('sidekick.cli').send({ msg = '{file}' })
      end,
      desc = 'Send File',
    },
    {
      '<leader>ap',
      function()
        require('sidekick.cli').prompt()
      end,
      desc = 'Sidekick Select Prompt',
      mode = { 'n', 'x' },
    },
    {
      '<leader>as',
      function()
        require('sidekick.cli').select()
      end,
      desc = 'Select CLI',
    },
    {
      '<leader>at',
      function()
        require('sidekick.cli').send({ msg = '{this}' })
      end,
      desc = 'Send This',
      mode = { 'n', 'x' },
    },
    {
      '<leader>av',
      function()
        require('sidekick.cli').send({ msg = '{selection}' })
      end,
      desc = 'Send Visual Selection',
      mode = { 'x' },
    },
  },
  opts = {
    mux = {
      -- enabled = true,
    },
  },
}
