return {
  'kevinhwang91/nvim-hlslens',
  config = function()
    local configuration = vim.api.nvim_call_function('sonokai#get_configuration', {})
    local palette =
      vim.api.nvim_call_function('sonokai#get_palette', { configuration.style, configuration.colors_override })

    require('hlslens').setup({
      build_position_cb = function(plist, _, _, _)
        require('scrollbar.handlers.search').handler.show(plist.start_pos)
      end,
    })

    vim.api.nvim_set_hl(0, 'HlSearchLens', { fg = palette.grey[1] })
    vim.api.nvim_set_hl(0, 'HlSearchNear', { fg = palette.red[1] })

    local kopts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap(
      'n',
      'n',
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap(
      'n',
      'N',
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  end,
  dependencies = {
    { 'sainnhe/sonokai' },
  },
  event = {
    'VeryLazy',
  },
}
