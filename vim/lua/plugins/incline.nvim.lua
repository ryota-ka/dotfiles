return {
  'b0o/incline.nvim',
  config = function()
    local color = require('utils.color')
    local palette = color.palette

    local function get_diagnostic_label(props)
      local icons = {
        Error = '',
        Warn = '󰀪',
        Info = '',
        Hint = '',
      }

      local label = {}

      for severity, icon in pairs(icons) do
        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        if n > 0 then
          table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
        end
      end

      if #label > 0 then
        table.insert(label, { '| ', guifg = palette.grey_dim[1] })
      end

      return label
    end

    local function get_git_diff_label(props)
      local icons = { removed = '-', changed = '~', added = '+' }
      local err, signs = pcall(vim.api.nvim_buf_get_var, props.buf, 'gitsigns_status_dict')

      if signs == nil or not err then
        return {}
      end

      local labels = {}

      for name, icon in pairs(icons) do
        if tonumber(signs[name]) and signs[name] > 0 then
          table.insert(labels, {
            icon .. signs[name] .. ' ',
            group = 'Diff' .. name,
          })
        end
      end

      if #labels > 0 then
        table.insert(labels, { '| ', guifg = palette.grey_dim[1] })
      end

      return labels
    end

    require('incline').setup({
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            group = 'Normal',
          },
          InclineNormalNC = {
            default = true,
            group = 'Comment',
          },
        },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':~:.')
        local ft_icon, ft_color = require('nvim-web-devicons').get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local cursor = vim.api.nvim_win_get_cursor(props.win)

        local buffer = {
          get_diagnostic_label(props),
          get_git_diff_label(props),
          { ft_icon, guifg = ft_color },
          { ' ' },
          { filename, gui = modified and 'bold' or nil },
          { ' | ', guifg = palette.grey_dim[1] },
          { string.format('%d:%d', cursor[1], cursor[2] + 1), guifg = palette.grey[1] },
        }
        return buffer
      end,
      window = {
        margin = {
          vertical = 0,
        },
        placement = {
          horizontal = 'right',
          vertical = 'bottom',
        },
      },
    })

    vim.api.nvim_create_autocmd({
      'DiagnosticChanged',
      'CursorMoved',
      'CursorMovedI',
    }, {
      callback = function()
        require('incline').refresh()
      end,
    })
  end,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'sainnhe/sonokai' },
  },
  event = {
    'BufNewFile',
    'BufReadPost',
  },
}
