return {
  'akinsho/git-conflict.nvim',
  cmd = {
    'GitConflictChooseBoth',
    'GitConflictChooseNone',
    'GitConflictChooseOurs',
    'GitConflictChooseTheirs',
    'GitConflictListQf',
    'GitConflictNextConflict',
    'GitConflictPrevConflict',
  },
  event = {
    'BufReadPost',
  },
  opts = {
    highlights = {
      ancestor = 'DiffDelete',
      current = 'DiffAdd',
      incoming = 'DiffChange',
    },
  },
  tag = 'v2.1.0',
}
