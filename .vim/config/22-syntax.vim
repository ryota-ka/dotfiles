NeoBundle 'scrooloose/syntastic'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'wting/rust.vim'

" syntastic rubocop
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['ruby', 'html', 'sh', 'vim', 'python', 'javascript', 'json', 'coffee'] }

let g:syntastic_ruby_checkers = ['rubocop']
au FileType ruby if exists('b:rails_root') |
      \ let b:syntastic_ruby_rubocop_options = '--rails' | endif

let g:syntastic_python_checkers = ['pep8']
