let s:eager_toml_directory = '~/.vim/config/neobundle/eager'
let s:lazy_toml_directory  = '~/.vim/config/neobundle/lazy'

if 0 | endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
call neobundle#load_cache()
NeoBundleFetch 'Shougo/neobundle.vim'

let s:eager_plugin_files = split(system('ls ' . s:eager_toml_directory))
let s:lazy_plugin_files  = split(system('ls ' . s:lazy_toml_directory))

for toml_file in s:eager_plugin_files
  call neobundle#load_toml(s:eager_toml_directory . '/' . toml_file)
endfor

for toml_file in s:lazy_plugin_files
  call neobundle#load_toml(s:lazy_toml_directory . '/' . toml_file, { 'lazy': 1 })
endfor

NeoBundleSaveCache

call neobundle#end()

filetype plugin indent on
colorscheme molokai
