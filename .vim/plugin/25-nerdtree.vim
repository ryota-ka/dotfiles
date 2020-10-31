if HasPlugin('nerdtree')
  nnoremap <silent> <C-n> :NERDTreeToggle<CR>

  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "M",
      \ "Staged"    : "A",
      \ "Untracked" : "?",
      \ "Renamed"   : "R",
      \ "Unmerged"  : "-",
      \ "Deleted"   : "D",
      \ "Dirty"     : "-",
      \ "Clean"     : "-",
      \ 'Ignored'   : '!',
      \ "Unknown"   : "?"
      \ }
endif
