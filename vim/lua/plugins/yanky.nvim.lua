return {
  'gbprod/yanky.nvim',
  keys = {
    {
      '<c-n>',
      '<Plug>(YankyNextEntry)',
      desc = 'Select next entry through yank history',
    },
    {
      '<c-p>',
      '<Plug>(YankyPreviousEntry)',
      desc = 'Select previous entry through yank history',
    },
    {
      '<leader>p',
      '<cmd>YankyRingHistory<cr>',
      desc = 'Open Yank History',
      mode = { 'n', 'x' },
    },
    {
      '<p',
      '<Plug>(YankyPutIndentAfterShiftLeft)',
      desc = 'Put and indent left',
    },
    {
      '<P',
      '<Plug>(YankyPutIndentBeforeShiftLeft)',
      desc = 'Put before and indent left',
    },
    {
      '=p',
      '<Plug>(YankyPutAfterFilter)',
      desc = 'Put after applying a filter',
    },
    {
      '=P',
      '<Plug>(YankyPutBeforeFilter)',
      desc = 'Put before applying a filter',
    },
    {
      '>p',
      '<Plug>(YankyPutIndentAfterShiftRight)',
      desc = 'Put and indent right',
    },
    {
      '>P',
      '<Plug>(YankyPutIndentBeforeShiftRight)',
      desc = 'Put before and indent right',
    },
    {
      '[p',
      '<Plug>(YankyPutIndentBeforeLinewise)',
      desc = 'Put indented before cursor (linewise)',
    },
    {
      '[P',
      '<Plug>(YankyPutIndentBeforeLinewise)',
      desc = 'Put indented before cursor (linewise)',
    },
    {
      ']p',
      '<Plug>(YankyPutIndentAfterLinewise)',
      desc = 'Put indented after cursor (linewise)',
    },
    {
      ']P',
      '<Plug>(YankyPutIndentAfterLinewise)',
      desc = 'Put indented after cursor (linewise)',
    },
    {
      'gp',
      '<Plug>(YankyGPutAfter)',
      desc = 'Put yanked text after selection',
      mode = { 'n', 'x' },
    },
    {
      'gP',
      '<Plug>(YankyGPutBefore)',
      desc = 'Put yanked text before selection',
      mode = { 'n', 'x' },
    },
    {
      'p',
      '<Plug>(YankyPutAfter)',
      desc = 'Put yanked text after cursor',
      mode = { 'n', 'x' },
    },
    {
      'P',
      '<Plug>(YankyPutBefore)',
      desc = 'Put yanked text before cursor',
      mode = { 'n', 'x' },
    },
    {
      'y',
      '<Plug>(YankyYank)',
      desc = 'Yank text',
      mode = { 'n', 'x' },
    },
  },
  opts = {},
}
