vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    vim.keymap.set('n', 'gqf', function()
      vim.lsp.buf.code_action({
        context = { only = { 'quickfix' } },
        filter = function(x)
          return x.isPreferred
        end,
        apply = true,
      })
    end, {
      buffer = args.buf,
      desc = 'Quick fix current',
    })

    vim.lsp.inlay_hint.enable(true, {
      bufnr = args.buf,
    })

    if client and client.name == 'eslint' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        command = 'LspEslintFixAll',
      })
    end
  end,
})

vim.lsp.enable('eslint')
vim.lsp.enable('graphql')
vim.lsp.enable('jsonls')
vim.lsp.enable('hls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('nil_ls')
vim.lsp.enable('prismals')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('terraformls')
-- vim.lsp.enable('ts_ls')
vim.lsp.enable('yamlls')
