if HasPlugin('vim-gitgutter')
  nnoremap ]h :GitGutterNextHunk<CR>
  nnoremap [h :GitGutterPrevHunk<CR>

  omap ih <Plug>(GitGutterTextObjectInnerPending)
  omap ah <Plug>(GitGutterTextObjectOuterPending)
  xmap ih <Plug>(GitGutterTextObjectInnerVisual)
  xmap ah <Plug>(GitGutterTextObjectOuterVisual)

  nnoremap <Leader>ga :GitGutterStageHunk<CR>
  nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
  nnoremap <Leader>gu :GitGutterUndoHunk<CR>
endif
