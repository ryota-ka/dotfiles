return {
  'saghen/blink.cmp',
  dependencies = {
    { 'fang2hou/blink-copilot' },
  },
  event = {
    'CmdlineEnter',
    'InsertEnter',
  },
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = 'rounded',
        },
      },
      menu = {
        border = 'rounded',
      },
    },
    keymap = {
      ['<C-Space>'] = {
        'hide_documentation',
        'show',
        'show_documentation',
      },
      preset = 'enter',
    },
    signature = {
      enabled = true,
      window = {
        border = 'rounded',
      },
    },
    sources = {
      default = {
        'buffer',
        'copilot',
        'lsp',
        'path',
        'snippets',
      },
      providers = {
        copilot = {
          async = true,
          module = 'blink-copilot',
          name = 'copilot',
        },
      },
    },
  },
  version = '1.*',
}
