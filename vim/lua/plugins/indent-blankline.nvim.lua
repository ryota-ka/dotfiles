return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    local highlight = {
      'Indent',
    }

    local hooks = require('ibl.hooks')
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'Indent', { fg = '#333333' })
    end)

    require('ibl').setup({
      indent = {
        char = '│',
        highlight = highlight,
      },
      scope = {
        enabled = false,
      },
    })
  end,
  event = {
    'BufNewFile',
    'BufReadPost',
  },
}
