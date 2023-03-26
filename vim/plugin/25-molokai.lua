if require('has_plugin')('molokai') then
  vim.cmd([[
    colorscheme molokai

    highlight Comment ctermfg=242
    highlight CursorLineNr ctermfg=208
    highlight Delimiter ctermfg=242
    highlight DiffAdd ctermfg=118 ctermbg=none
    highlight DiffChange ctermfg=208 ctermbg=none
    highlight DiffDelete ctermfg=161 ctermbg=none
    highlight Label ctermfg=185
    highlight NormalNC ctermfg=246
    highlight Search ctermbg=220
    highlight SignColumn ctermbg=234
    highlight String ctermfg=185
    highlight Type ctermfg=42
    highlight VertSplit ctermfg=240 ctermbg=none cterm=none
    highlight Visual ctermbg=238
  ]])
end
