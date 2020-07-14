set runtimepath+=~/.vim

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'haskell/haskell-ide-engine', { 'for': 'haskell' }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }
Plug 'itchyny/vim-parenmatch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-smartinput'
Plug 'mattn/emmet-vim', { 'for': ['html', 'haml', 'typescript'] }
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'purescript-contrib/purescript-vim', { 'for': 'purescript' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/unite.vim', { 'on': 'Unite' }
Plug 'Shougo/vimfiler.vim'
Plug 'thinca/vim-quickrun'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tsukkee/unite-tag', { 'on': 'Unite' }
Plug 'tyru/caw.vim'
Plug 'uarun/vim-protobuf', { 'for': 'proto' }
Plug 'vim-scripts/vim-stylus', { 'for': 'stylus' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

call plug#end()
