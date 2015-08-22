NeoBundle 'tpope/vim-endwise'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundleLazy 'vim-scripts/ruby-matchit', {
      \   'autoload': {'filetype': ['ruby']}
      \ }
NeoBundle 'kana/vim-smartinput'
NeoBundle 'mattn/emmet-vim'

NeoBundle "tyru/caw.vim.git"
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
