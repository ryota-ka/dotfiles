vim.keymap.set(
  'i',
  '<tab>',
  'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
  { silent = true, noremap = true, expr = true, replace_keycodes = false }
)
vim.keymap.set(
  'i',
  '<s-tab>',
  [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
  { silent = true, noremap = true, expr = true, replace_keycodes = false }
)

function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use <c-space> to trigger completion.
vim.keymap.set('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

vim.keymap.set(
  'i',
  '<cr>',
  [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  { silent = true, noremap = true, expr = true, replace_keycodes = false }
)

-- Use `[c` and `]c` to navigate diagnostics
vim.keymap.set('n', '[c', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.keymap.set('n', ']c', '<Plug>(coc-diagnostic-next)', { silent = true })

-- Remap keys for gotos
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

vim.keymap.set('n', '_', '<Plug>(coc-codeaction-cursor)', { silent = true })

-- Use K to show documentation in preview window
vim.keymap.set('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })

function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

vim.api.nvim_create_autocmd('CursorHold', {
  command = "silent call CocActionAsync('highlight')",
  desc = 'Highlight symbol under cursor on CursorHold',
})

-- Remap for rename current word
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')

-- Remap for format selected region
vim.keymap.set('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
vim.keymap.set('n', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })

-- Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vim.keymap.set('x', '<leader>a', '<Plug>(coc-codeaction-selected)')
vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction-selected)')

-- Remap for do codeAction of current line
vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction)')
-- Fix autofix problem of current line
vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)')

-- Use `:Format` to format current buffer
vim.api.nvim_create_user_command('Format', "call CocAction('format')", {})

-- Use `:Fold` to fold current buffer
vim.api.nvim_create_user_command('Fold', "call CocAction('fold', <f-args>)", { nargs = '?' })

-- use `:OR` for organize import of current buffer
vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add status line support, for integration with other plugin, checkout `:h coc-status`
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Using CocList
-- Show all diagnostics
vim.keymap.set('n', '<space>a', ':CocList diagnostics<CR>', { nowait = true, silent = true })
-- Manage extensions
vim.keymap.set('n', '<space>e', ':CocList extensions<CR>', { nowait = true, silent = true })
-- Show commands
vim.keymap.set('n', '<space>c', ':CocList commands<CR>', { nowait = true, silent = true })
-- Find symbol of current document
vim.keymap.set('n', '<space>o', ':CocList outline<CR>', { nowait = true, silent = true })
-- Search workspace symbols
vim.keymap.set('n', '<space>s', ':CocList -I symbols<CR>', { nowait = true, silent = true })
-- Do default action for next item.
vim.keymap.set('n', '<space>j', ':CocNext<CR>', { nowait = true, silent = true })
-- Do default action for previous item.
vim.keymap.set('n', '<space>k', ':CocPrev<CR>', { nowait = true, silent = true })
-- Resume latest coc list
vim.keymap.set('n', '<space>p', ':CocListResume<CR>', { nowait = true, silent = true })

-- Use <C-k> for both expand and jump (make expand higher priority.)
vim.keymap.set('i', '<c-k>', '<Plug>(coc-snippets-expand-jump)')
