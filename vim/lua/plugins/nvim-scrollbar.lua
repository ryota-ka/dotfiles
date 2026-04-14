return {
  'petertriho/nvim-scrollbar',
  config = function()
    local color = require('utils.color')
    local palette = color.palette

    require('scrollbar').setup({
      excluded_filetypes = {
        '',
        'cmp_docs',
        'cmp_menu',
        'nofile',
        'noice',
        'prompt',
        'snacks_picker_input',
        'snacks_picker_list',
      },
      handle = {
        color = palette.bg4[1],
      },
      marks = {
        Error = { color = palette.red[1] },
        GitAdd = { text = '│' },
        GitChange = { text = '│' },
        Hint = { color = palette.green[1] },
        Info = { color = palette.blue[1] },
        Misc = { color = palette.purple[1] },
        Search = { color = palette.orange[1] },
        Warn = { color = palette.yellow[1] },
      },
    })

    require('scrollbar.handlers').register('marks', function(bufnr)
      local marks = vim.fn.getmarklist(bufnr)
      local out = {}

      for _, tbl in pairs(marks) do
        local mark = tbl.mark:sub(2, 2)
        table.insert(out, {
          level = 8,
          line = tbl.pos[2],
          text = mark,
          type = 'Info',
        })
      end

      return out
    end)
  end,
  dependencies = {
    { 'sainnhe/sonokai' },
  },
  event = {
    'BufNewFile',
    'BufReadPost',
  },
}
