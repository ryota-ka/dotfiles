-- ignore cases
vim.opt.ignorecase = true

-- do not ignore cases when the query includes both small and capital letters
vim.opt.smartcase = true

if vim.fn.has('nvim') == 1 then
  vim.opt.inccommand = 'split'
end

vim.keymap.set('n', 'n', 'n:call BlinkNextMatch()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'N:call BlinkNextMatch()<CR>', { noremap = true, silent = true })

vim.cmd([[
  function! BlinkNextMatch() abort
    highlight JustMatched ctermfg=white ctermbg=magenta cterm=bold

    let pat = '\c\%#' . @/
    let id = matchadd('JustMatched', pat)
    redraw

    exec 'sleep 150m'
    call matchdelete(id)
    redraw
  endfunction
]])

vim.keymap.set('v', '/', 'y/<C-r>"<CR>', { noremap = true })
