return require('packer').startup(function(use)
  use({
    'akinsho/git-conflict.nvim',
    after = { 'sonokai' },
    config = function()
      require('git-conflict').setup()

      local configuration = vim.api.nvim_call_function('sonokai#get_configuration', {})
      local palette = vim.api.nvim_call_function('sonokai#get_palette', { configuration.style, configuration.colors_override })

      vim.api.nvim_set_hl(0, 'GitConflictAncestor', { bg = palette.diff_red[1] })
      vim.api.nvim_set_hl(0, 'GitConflictAncestorLabel', { bg = palette.bg_red[1] })
      vim.api.nvim_set_hl(0, 'GitConflictCurrent', { bg = palette.diff_blue[1] })
      vim.api.nvim_set_hl(0, 'GitConflictCurrentLabel', { bg = palette.bg_blue[1] })
      vim.api.nvim_set_hl(0, 'GitConflictIncoming', { bg = palette.diff_green[1] })
      vim.api.nvim_set_hl(0, 'GitConflictIncomingLabel', { bg = palette.bg_green[1] })
    end,
  })
  use({
    'andersevenrud/nvim_context_vt',
    config = function()
      vim.api.nvim_set_hl(0, 'ContextVt', { fg = '#555555' })

      require('nvim_context_vt').setup({});
    end,
  })
  use({
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end
  })
  use({ 'davidosomething/coc-diagnostics-shim.nvim' })
  use({ 'easymotion/vim-easymotion' })
  use({ 'editorconfig/editorconfig-vim' })
  use({ 'hashivim/vim-terraform' })
  use({ 'haskell/haskell-ide-engine', ft = { 'haskell' } })
  use({ 'HiPhish/rainbow-delimiters.nvim' })
  use({ 'hotwatermorning/auto-git-diff', ft = { 'gitrebase' } })
  use({ 'jghauser/mkdir.nvim' })
  use({ 'junegunn/fzf' })
  use({ 'junegunn/fzf.vim' })
  use({ 'junegunn/vim-peekaboo' })
  use({
    'kevinhwang91/nvim-bqf',
    ft = { 'qf' },
  })
  use({ 'kshenoy/vim-signature' })
  use({
    'kwkarlwang/bufresize.nvim',
    config = function()
      require('bufresize').setup()
    end,
  })
  use({
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup({})
    end
  })
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame_opts = {
          virt_text_pos = 'overlay',
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', ']g', function()
            if vim.wo.diff then return ']g' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[g', function()
            if vim.wo.diff then return '[g' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '<leader>ga', gs.stage_hunk)
          map('n', '<leader>gr', gs.reset_hunk)
          map('v', '<leader>ga', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
          map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
          map('n', '<leader>gA', gs.stage_buffer)
          map('n', '<leader>gu', gs.undo_stage_hunk)
          map('n', '<leader>gR', gs.reset_buffer)
          map('n', '<leader>gs', gs.preview_hunk)
          map('n', '<leader>gb', function() gs.blame_line { full = true } end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>gd', gs.diffthis)
          map('n', '<leader>gD', function() gs.diffthis('~') end)
          map('n', '<leader>gt', gs.toggle_deleted)

          map({'o', 'x'}, 'ig', ':<C-U>Gitsigns select_hunk<CR>')

          require('scrollbar.handlers.gitsigns').setup()
        end
      })
    end
  })
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      local highlight = {
        'Indent',
      }

      local hooks = require('ibl.hooks')
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'Indent', { fg = '#333333' })
      end)

      require('ibl').setup {
        indent = {
          highlight = highlight,
        },
        scope = {
          enabled = false,
        },
      }
    end,
  })
  use({ 'm-demare/hlargs.nvim' })
  use({ 'mattn/emmet-vim', ft = { 'html', 'typescript.tsx' } })
  use({ 'metakirby5/codi.vim' })
  use({
    'mvllow/modes.nvim',
    config = function()
      require('modes').setup()
    end
  })
  use({ 'neoclide/coc.nvim', run = 'yarn install' })
  use({ 'nvim-tree/nvim-web-devicons' })
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        autotag = {
          enable = true,
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '+',
            node_decremental = '-',
            node_incremental = '+',
          },
        },
        indent = {
          enable = true,
        },
        matchup = {
          enable = true,
        },
        sync_install = false,
      })
    end,
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })()
    end,
  })
  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  })
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  })
  use({
    'petertriho/nvim-scrollbar',
    config = function()
      local configuration = vim.api.nvim_call_function('sonokai#get_configuration', {})
      local palette = vim.api.nvim_call_function('sonokai#get_palette', {
        configuration.style,
        configuration.colors_override,
      })

      require('scrollbar').setup({
        excluded_filetypes = {
          'cmp_docs',
          'cmp_menu',
          'nerdtree',
          'noice',
          'prompt',
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
    after = {
      'sonokai',
    },
  })
  use({
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        filetypes_denylist = {
          'gitcommit',
          'markdown',
          'nerdtree',
        },
        providers = {
          'lsp',
          'treesitter',
          'regex',
        },
      })
    end
  })
  use({ 'scrooloose/nerdtree', cmd = { 'NERDTreeFind', 'NERDTreeToggle' } })
  use({
    'sainnhe/sonokai',
    config = function()
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_float_style = 'dim'
      vim.g.sonokai_transparent_background = 2
      vim.cmd('colorscheme sonokai')
    end,
  })
  use({ 'SirVer/ultisnips' })
  use({
    'sQVe/sort.nvim',
    config = function()
      require('sort').setup({})
    end,
  })
    'stevearc/stickybuf.nvim',
    config = function()
      require('stickybuf').setup()
    end,
  })
  use({ 'thinca/vim-quickrun' })
  use({ 'tpope/vim-fugitive' })
  use({ 'vim-scripts/vim-stylus', ft = { 'stylus' } })
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  })
  use({ 'windwp/nvim-ts-autotag' })
  use({ 'wsdjeg/vim-fetch' })
  use({ 'Xuyuanp/nerdtree-git-plugin', cmd = { 'NERDTreeToggle' } })
end)
