vim.lsp.enable('vtsls')
vim.lsp.enable('cssls')

return {
  -- auto pairs for JSX
  {
    'windwp/nvim-ts-autotag',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
}
