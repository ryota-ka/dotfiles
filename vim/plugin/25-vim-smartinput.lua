vim.api.nvim_call_function('smartinput#map_to_trigger', { 'i', '<Space>', '<Space>', '<Space>' })

vim.api.nvim_call_function(
  'smartinput#define_rule',
  { {
    at = '(\\%#)',
    char = '<Space>',
    input = '<Space><Space><Left>',
  } }
)

vim.api.nvim_call_function(
  'smartinput#define_rule',
  { {
    at = '{\\%#}',
    char = '<Space>',
    input = '<Space><Space><Left>',
  } }
)

vim.api.nvim_call_function('smartinput#define_rule', {
  {
    at = '( \\%# )',
    char = '<BS>',
    input = '<Del><BS>',
  },
})

vim.api.nvim_call_function('smartinput#define_rule', {
  {
    at = '\\\\s\\\\+\\\\%#',
    char = '<CR>',
    input = "<C-o>:call setline('.', substitute(getline('.'), '\\\\s\\\\+$', '', ''))<CR><CR>",
  },
})

vim.api.nvim_call_function('smartinput#map_to_trigger', { 'i', '$', '$', '$' })

vim.api.nvim_call_function(
  'smartinput#define_rule',
  { {
    at = '`.*\\%#.*`',
    char = '$',
    input = '${}<Left>',
    filetype = { 'typescript' },
  } }
)
