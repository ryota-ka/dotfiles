let s:dein_dir = expand('~/.cache/dein')

let s:toml_path = expand('~/.vim/config/dein/eager.toml')
let s:toml_lazy_path = expand('~/.vim/config/dein/lazy.toml')

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_path, { 'lazy': 0 })
  call dein#load_toml(s:toml_lazy_path, { 'lazy': 1 })

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


filetype plugin indent on

colorscheme molokai
