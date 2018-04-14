if HasPlugin('vim-gitgutter')
  nnoremap ]h :GitGutterNextHunk<CR>
  nnoremap [h :GitGutterPrevHunk<CR>
  nnoremap ghs :GitGutterStageHunk<CR>

  omap ih <Plug>GitGutterTextObjectInnerPending
  omap ah <Plug>GitGutterTextObjectOuterPending
  xmap ih <Plug>GitGutterTextObjectInnerVisual
  xmap ah <Plug>GitGutterTextObjectOuterVisual
endif
