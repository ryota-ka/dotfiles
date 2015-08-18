NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'linux'   : 'make',
      \     'unix'    : 'gmake',
      \    },
      \ }
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomasr/molokai'
NeoBundleLazy 'thinca/vim-ref', {
      \     'autoload': { 'commands': ['Ref'] }
      \  }
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'editorconfig/editorconfig-vim'

let s:bundle = neobundle#get("vim-quickrun")
function! s:bundle.hooks.on_source(bundle)
  let g:quickrun_config = {
        \   "_" : {
        \       "runner" : "vimproc",
        \       "runner/vimproc/updatetime" : 60
        \   },
        \   "c": {
        \      "cmdopt" : "-std=c99"
        \   }
        \}
endfunction
unlet s:bundle
