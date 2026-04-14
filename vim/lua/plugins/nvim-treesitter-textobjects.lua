return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter' },
  },
  event = {
    'VeryLazy',
  },
  opts = {
    move = {
      enable = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']c'] = { query = '@class.outer', desc = 'Next class start' },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a 'query' key to group multiple queires.
        [']o'] = '@loop.*',
        -- [']o'] = { query = { '@loop.inner', '@loop.outer' } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
        [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']C'] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[c'] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[C'] = '@class.outer',
      },
      set_jumps = true,
    },
    select = {
      enable = true,

      include_surrounding_whitespace = false,
      keymaps = {
        ['ac'] = '@class.outer',
        ['af'] = '@function.outer',
        ['ic'] = '@class.inner',
        ['if'] = '@function.inner',
      },
      lookahead = true,
      selection_modes = {
        ['@class.outer'] = '<c-v>',
        ['@function.outer'] = 'V',
        ['@parameter.outer'] = 'v',
      },
    },
    swap = {
      enable = true,

      swap_next = {
        ['<leader>sa'] = '@parameter.inner',
        ['<leader>sf'] = '@function.outer',
        ['<leader>ss'] = '@statement.outer',
      },
      swap_previous = {
        ['<leader>sA'] = '@parameter.inner',
        ['<leader>sF'] = '@function.outer',
        ['<leader>sS'] = '@statement.outer',
      },
    },
  },
}
