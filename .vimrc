set runtimepath+=~/.vim

call plug#begin('~/.local/share/nvim/plugged')

Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'delphinus/vim-auto-cursorline'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'haskell/haskell-ide-engine', { 'for': 'haskell' }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-parenmatch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-smartinput'
Plug 'mattn/emmet-vim', { 'for': ['html', 'haml', 'typescript'] }
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'purescript-contrib/purescript-vim', { 'for': 'purescript' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/vimfiler.vim'
Plug 'SirVer/ultisnips'
Plug 'thinca/vim-quickrun'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'uarun/vim-protobuf', { 'for': 'proto' }
Plug 'vim-scripts/vim-stylus', { 'for': 'stylus' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

call plug#end()
