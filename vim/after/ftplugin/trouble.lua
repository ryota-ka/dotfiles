vim.keymap.set('n', ']]', function()
  require('trouble').next()
end, { buffer = true, desc = 'Next trouble item' })

vim.keymap.set('n', '[[', function()
  require('trouble').prev()
end, { buffer = true, desc = 'Previous trouble item' })
