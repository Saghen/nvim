-- LSPs
vim.api.nvim_create_autocmd('BufRead', {
  pattern = { '*.tsx', '*.jsx', '*.ts', '*.js' },
  callback = function() vim.lsp.enable('vtsls') end,
})
vim.api.nvim_create_autocmd('BufRead', {
  pattern = { '*.css' },
  callback = function() vim.lsp.enable('css') end,
})

return {
  -- auto pairs for JSX
  {
    'windwp/nvim-ts-autotag',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
}
