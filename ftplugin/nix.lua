vim.lsp.config('nil_ls', {
  settings = { ['nil'] = {
    formatting = { command = 'nixfmt', args = { '--indent-with-tab' } },
  } },
})
vim.lsp.enable('nil_ls')
