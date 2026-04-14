return {
  '3rd/diagram.nvim',
  dependencies = {
    { '3rd/image.nvim', opts = {} },
  },
  ft = {
    'markdown',
  },
  keys = {
    {
      '<leader>pd',
      function()
        require('diagram').show_diagram_hover()
      end,
      desc = 'Preview diagram',
      ft = {
        'markdown',
      },
    },
  },
  config = function()
    require('diagram').setup({
      integrations = {
        require('diagram.integrations.markdown'),
      },
    })
  end,
}
