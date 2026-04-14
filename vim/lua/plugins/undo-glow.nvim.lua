return {
  'y3owk1n/undo-glow.nvim',
  event = {
    'VeryLazy',
  },
  init = function()
    vim.api.nvim_create_autocmd('TextYankPost', {
      desc = 'Highlight when yanking (copying) text',
      callback = function()
        require('undo-glow').yank()
      end,
    })
  end,
  keys = {
    {
      '#',
      function()
        require('undo-glow').search_hash({
          animation = {
            animation_type = 'strobe',
          },
        })
      end,
      desc = 'Search hash with highlight',
      mode = 'n',
      noremap = true,
    },
    {
      '*',
      function()
        require('undo-glow').search_star({
          animation = {
            animation_type = 'strobe',
          },
        })
      end,
      desc = 'Search star with highlight',
      mode = 'n',
      noremap = true,
    },
    {
      'gc',
      function()
        local pos = vim.fn.getpos('.')
        vim.schedule(function()
          vim.fn.setpos('.', pos)
        end)
        return require('undo-glow').comment()
      end,
      desc = 'Toggle comment with highlight',
      expr = true,
      mode = { 'n', 'x' },
      noremap = true,
    },
    {
      'gc',
      function()
        require('undo-glow').comment_textobject()
      end,
      desc = 'Comment textobject with highlight',
      mode = 'o',
      noremap = true,
    },
    {
      'gcc',
      function()
        return require('undo-glow').comment_line()
      end,
      desc = 'Toggle comment line with highlight',
      expr = true,
      mode = 'n',
      noremap = true,
    },
    {
      'n',
      function()
        require('undo-glow').search_next({
          animation = {
            animation_type = 'strobe',
          },
        })
      end,
      desc = 'Search next with highlight',
      mode = 'n',
      noremap = true,
    },
    {
      'N',
      function()
        require('undo-glow').search_prev({
          animation = {
            animation_type = 'strobe',
          },
        })
      end,
      desc = 'Search prev with highlight',
      mode = 'n',
      noremap = true,
    },
    {
      'p',
      function()
        require('undo-glow').paste_below()
      end,
      desc = 'Paste below with highlight',
      mode = 'n',
      noremap = true,
    },
    {
      'P',
      function()
        require('undo-glow').paste_above()
      end,
      desc = 'Paste above with highlight',
      mode = 'n',
      noremap = true,
    },
    {
      'u',
      function()
        require('undo-glow').undo()
      end,
      desc = 'Undo with highlight',
      mode = 'n',
      noremap = true,
    },
    {
      'U',
      function()
        require('undo-glow').redo()
      end,
      desc = 'Redo with highlight',
      mode = 'n',
      noremap = true,
    },
  },
  ---@type UndoGlow.Config
  opts = {
    animation = {
      enabled = true,
      duration = 100,
      animation_type = 'fade',
    },
    highlights = {
      undo = {
        hl_color = { bg = '#693232' },
      },
      redo = {
        hl_color = { bg = '#2F4640' },
      },
      yank = {
        hl_color = { bg = '#7A683A' },
      },
      paste = {
        hl_color = { bg = '#325B5B' },
      },
      search = {
        hl_color = { bg = '#5C475C' },
      },
      comment = {
        hl_color = { bg = '#7A5A3D' },
      },
      cursor = {
        hl_color = { bg = '#793D54' },
      },
    },
    priority = 2048 * 3,
  },
}
