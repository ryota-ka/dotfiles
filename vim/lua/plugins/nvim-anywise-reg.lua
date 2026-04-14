return {
  'AckslD/nvim-anywise-reg.lua',
  keys = {
    '<M-p>',
    '<M-P>',
  },
  opts = {
    paste_keys = {
      ['<M-p>'] = 'p',
      ['<M-P>'] = 'P',
    },
    operators = { 'c', 'd', 'y' },
    textobjects = {
      { 'i', 'a' },
      { 'w', 'W', 'f', 'c' },
    },
  },
}
