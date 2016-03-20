let s:toml_path = expand('~/.vim/config/dein/eager.toml')
let s:toml_lazy_path = expand('~/.vim/config/dein/lazy.toml')

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

if dein#load_cache([s:toml_path, s:toml_lazy_path])
  call dein#load_toml(s:toml_path, { 'lazy': 0 })
  call dein#load_toml(s:toml_lazy_path, { 'lazy': 1 })

  call dein#save_cache()
endif

if dein#check_install()
  call dein#install()
endif

call dein#end()

filetype plugin indent on

colorscheme molokai
