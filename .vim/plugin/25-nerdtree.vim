if HasPlugin('nerdtree')
  nnoremap <silent> <C-n> :NERDTreeToggle<CR>

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
