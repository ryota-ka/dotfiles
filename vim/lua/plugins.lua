return require('packer').startup(function(use)
  use({ 'cespare/vim-toml', ft = { 'toml' } })
  use({ 'delphinus/vim-auto-cursorline' })
  use({ 'digitaltoad/vim-pug' })
  use({ 'easymotion/vim-easymotion' })
  use({ 'editorconfig/editorconfig-vim' })
  use({ 'hashivim/vim-terraform' })
  use({ 'haskell/haskell-ide-engine', ft = { 'haskell' } })
  use({ 'itchyny/lightline.vim' })
  use({ 'itchyny/vim-cursorword' })
  use({ 'itchyny/vim-parenmatch' })
  use({ 'junegunn/fzf' })
  use({ 'junegunn/fzf.vim' })
  use({ 'junegunn/vim-peekaboo' })
  use({ 'kana/vim-smartinput' })
  use({ 'kshenoy/vim-signature' })
  use({ 'LnL7/vim-nix' })
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
  use({ 'mattn/emmet-vim', ft = { 'html', 'typescript.tsx' } })
  use({ 'metakirby5/codi.vim' })
  use({
    'mvllow/modes.nvim',
    config = function()
      require('modes').setup()
    end
  })
  use({ 'neoclide/coc.nvim', run = 'yarn install' })
  use({ 'neovimhaskell/haskell-vim', ft = { 'haskell' } })
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        indent = {
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
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  })
  use({ 'othree/html5.vim', ft = { 'html' } })
  use({ 'purescript-contrib/purescript-vim', ft = { 'purescript' } })
  use({ 'rust-lang/rust.vim', ft = { 'rust' } })
  use({ 'scrooloose/nerdtree', cmd = { 'NERDTreeFind', 'NERDTreeToggle' } })
  use({
    'sainnhe/sonokai',
    config = function()
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_float_style = 'dim'
      vim.g.sonokai_transparent_background = 1
      vim.cmd('colorscheme sonokai')
    end,
  })
  use({ 'SirVer/ultisnips' })
  use({ 'thinca/vim-quickrun' })
  use({ 'tpope/vim-fugitive' })
  use({ 'tpope/vim-surround' })
  use({ 'vim-scripts/vim-stylus', ft = { 'stylus' } })
  use({ 'Xuyuanp/nerdtree-git-plugin', cmd = { 'NERDTreeToggle' } })
end)
