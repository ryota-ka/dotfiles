local function get_current_text()
  local visual = Snacks.picker.util.visual()

  return visual and visual.text or ''
end

local function files()
  local text = get_current_text()
  local is_git = require('snacks.git').get_root() ~= nil

  -- Get git status for priority boosting and display
  local git_status_map = {}
  if is_git then
    local output = vim.fn.systemlist('git status --porcelain -uall')
    if vim.v.shell_error == 0 then
      for _, line in ipairs(output) do
        local status = line:sub(1, 2)
        local file = line:sub(4)
        if file ~= '' then
          git_status_map[file] = status
        end
      end
    end
  end

  -- Get open buffer paths for priority boosting
  local open_buffers = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local name = vim.api.nvim_buf_get_name(buf)
      if name ~= '' then
        local rel = vim.fn.fnamemodify(name, ':.')
        open_buffers[rel] = true
      end
    end
  end

  -- Build multi sources based on git availability
  local multi_sources = {
    'buffers',
    { source = 'recent', filter = { cwd = true } },
    is_git and { source = 'git_files', args = { untracked = true } } or 'files',
  }

  -- Track seen files for deduplication
  local seen_files = {}

  Snacks.picker.pick({
    source = 'smart',
    title = 'Files',
    pattern = text,
    multi = multi_sources,
    format = 'file',
    formatters = {
      file = {
        git_status_hl = true,
      },
    },
    matcher = {
      cwd_bonus = true,
      frecency = true,
      sort_empty = true,
    },
    transform = function(item)
      if item.file then
        -- Normalize path for deduplication
        local abs = vim.fn.fnamemodify(item.file, ':p')

        -- Filter out duplicates
        if seen_files[abs] then
          return false
        end
        seen_files[abs] = true

        local rel = vim.fn.fnamemodify(item.file, ':.')

        -- Attach git status for display and preview
        local status = git_status_map[rel]
        if status then
          item.status = status
        end

        -- Boost score for open buffers (highest priority)
        if open_buffers[rel] then
          item.score = (item.score or 0) + 10000
        end

        -- Boost score for git-modified files
        if status then
          item.score = (item.score or 0) + 5000
        end
      end
    end,
    sort = {
      fields = { 'score:desc', '#text', 'idx' },
    },
    -- Custom preview: show git diff for modified files, otherwise file preview
    preview = function(ctx)
      local previewer = require('snacks.picker.preview')
      if ctx.item.status then
        -- Use git_status preview for files with git changes
        previewer.git_status(ctx)
      else
        -- Use default file preview
        previewer.file(ctx)
      end
    end,
  })
end

local function overlook(picker, item)
  picker:close()

  local bufnr = vim.fn.bufadd(item.file)
  vim.fn.bufload(bufnr)

  require('overlook.ui').create_popup({
    col = item.pos[2],
    lnum = item.pos[1],
    target_bufnr = bufnr,
    title = vim.fn.fnamemodify(item.file, ':.'),
  })

  vim.schedule(function()
    if vim.w.is_overlook_popup then
      vim.keymap.set('n', '<C-o>', function()
        require('overlook.api').open_in_original_window()
      end, { buffer = true, desc = 'Overlook: Open in original window' })
    end
  end)
end

return {
  'folke/snacks.nvim',
  dependencies = {
    {
      'WilliamHsieh/overlook.nvim',
      lazy = true,
      opts = {
        ui = {
          keys = {
            close = '<Esc>',
          },
          size_ratio = 0.8,
        },
      },
    },
  },
  keys = {
    {
      '<leader><leader>',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      '<leader>b',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>d',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>D',
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = 'Diagnostics Buffer',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer.reveal()
      end,
      desc = 'File Explorer',
    },
    {
      '<leader>h',
      function()
        Snacks.picker.recent({ cwd = true })
      end,
      desc = 'Recent Files',
    },
    {
      '<leader>l',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Buffer Lines',
    },
    {
      '<leader>r',
      function()
        Snacks.rename.rename_file()
      end,
      desc = 'Rename File',
    },
    {
      '<leader>/',
      function()
        local text = get_current_text()

        Snacks.picker.git_grep({
          on_show = function()
            vim.api.nvim_put({ text }, 'c', true, true)
          end,
        })
      end,
      desc = 'Git Grep',
      mode = { 'n', 'x' },
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>n',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>f',
      files,
      desc = 'Files',
      mode = { 'n', 'x' },
    },
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>gd',
      function()
        Snacks.picker.git_diff()
      end,
      desc = 'Git Diff Hunks',
    },
    {
      '<leader>j',
      function()
        Snacks.picker.jumps()
      end,
      desc = 'Jumps',
    },
    {
      '<leader>m',
      function()
        Snacks.picker.marks()
      end,
      desc = 'Marks',
    },
    {
      '<leader>q',
      function()
        Snacks.picker.qflist()
      end,
      desc = 'Quickfix List',
    },
    {
      '<leader>s',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP Symbols',
    },
    {
      '<leader>u',
      function()
        Snacks.picker.undo()
      end,
      desc = 'Undo History',
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions({
          auto_confirm = true,
          confirm = overlook,
        })
      end,
      desc = 'LSP Definitions',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations({
          auto_confirm = true,
          confirm = overlook,
        })
      end,
      desc = 'LSP Declarations',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references({
          auto_confirm = true,
          confirm = overlook,
        })
      end,
      desc = 'LSP References',
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations({
          auto_confirm = true,
          confirm = overlook,
        })
      end,
      desc = 'LSP Implementations',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions({
          auto_confirm = true,
          confirm = overlook,
        })
      end,
      desc = 'LSP Type Definitions',
    },
  },
  lazy = false,
  opts = {
    bigfile = {},
    dashboard = {
      formats = {
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ':.')
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ':h')
            local file = vim.fn.fnamemodify(fname, ':t')
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. '/…' .. file
            end
          end
          local dir, file = fname:match('^(.*)/(.+)$')
          return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
        end,
      },
      pane_gap = 4,
      sections = {
        {
          cwd = true,
          filter = function(file)
            return file and not file:find('/.git/')
          end,
          indent = 1,
          limit = 9,
          padding = 1,
          pane = 1,
          section = 'recent_files',
          title = 'Recent Files',
        },
        {
          desc = 'Restore session',
          icon = '',
          key = 's',
          pane = 1,
          section = 'session',
        },
        (function()
          local items = {
            pane = 2,
            title = 'Git Status',
            padding = 1,
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
          }
          local cwd = vim.fn.getcwd()
          local output = vim.fn.systemlist('git status --porcelain')
          local keys = 'abcdefghi'
          local limit = 9
          if vim.v.shell_error == 0 then
            local count = 0
            for _, line in ipairs(output) do
              local status = line:sub(1, 2)
              local file = line:sub(4)
              if file ~= '' then
                count = count + 1
                if count <= limit then
                  table.insert(items, {
                    file = cwd .. '/' .. file,
                    icon = status,
                    action = ':edit ' .. vim.fn.fnameescape(file),
                    key = keys:sub(count, count),
                  })
                end
              end
            end
          end
          return items
        end)(),
        (function()
          local items = {
            pane = 2,
            title = 'Git Branches',
            padding = 1,
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
          }
          local current = vim.fn.system('git branch --show-current'):gsub('\n', '')
          local output = vim.fn.systemlist('git branch --sort=-committerdate --format="%(refname:short)"')
          local keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
          local limit = 5
          if vim.v.shell_error == 0 then
            local count = 0
            for _, branch in ipairs(output) do
              if branch ~= '' then
                count = count + 1
                if count <= limit then
                  local prefix = branch == current and '* ' or '  '
                  table.insert(items, {
                    text = prefix .. branch,
                    action = function()
                      vim.cmd('Git checkout ' .. branch)
                      Snacks.dashboard.update()
                    end,
                    key = keys:sub(count, count),
                  })
                end
              end
            end
          end
          return items
        end)(),
        {
          action = function()
            Snacks.gitbrowse()
          end,
          desc = 'Open GitHub',
          enabled = function()
            return Snacks.git.get_root() ~= nil and vim.fn.system('git remote get-url origin'):find('github.com') ~= nil
          end,
          icon = '',
          key = 'G',
          padding = 1,
          pane = 2,
        },
      },
      width = 50,
    },
    explorer = {},
    notifier = {},
    picker = {
      win = {
        input = {
          keys = {
            ['<C-a>'] = {
              '<Home>',
              mode = 'i',
              expr = true,
              desc = 'Go to beginning of line',
            },
            ['<C-b>'] = {
              '<Left>',
              mode = 'i',
              expr = true,
              desc = 'Move back one character',
            },
            ['<C-e>'] = {
              '<End>',
              mode = 'i',
              expr = true,
              desc = 'Go to end of line',
            },
            ['<C-f>'] = {
              '<Right>',
              mode = 'i',
              expr = true,
              desc = 'Move forward one character',
            },
            ['<M-a>'] = {
              'select_all',
              mode = { 'i', 'n' },
              desc = 'Select all items',
            },
          },
        },
      },
    },
    quickfile = {},
    rename = {},
    statuscolumn = {},
  },
  priority = 1000,
}
