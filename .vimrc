set runtimepath+=~/.vim

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'haskell/haskell-ide-engine', { 'for': 'haskell' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }
Plug 'itchyny/vim-parenmatch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-smartinput'
Plug 'mattn/emmet-vim', { 'for': ['html', 'haml', 'typescript'] }
Plug 'metakirby5/codi.vim'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'purescript-contrib/purescript-vim', { 'for': 'purescript' }
Plug 'roxma/nvim-completion-manager', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/unite.vim', { 'on': 'Unite' }
Plug 'Shougo/vimfiler.vim'
Plug 'thinca/vim-quickrun'
Plug 'tomasr/molokai'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tsukkee/unite-tag', { 'on': 'Unite' }
Plug 'tyru/caw.vim'
Plug 'uarun/vim-protobuf', { 'for': 'proto' }
Plug 'vim-scripts/vim-stylus', { 'for': 'stylus' }
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

call plug#end()
