vim.lsp.config('lua_ls', {
  settings = { Lua = { completion = { callSnippet = 'Replace' } } },
})
vim.lsp.enable('lua_ls')

return {
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'lua', 'luadoc', 'luap' } },
  },

  -- LSP
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    dependencies = {
      'Bilal2453/luvit-meta',
      {
        'saghen/blink.cmp',
        opts = {
          sources = {
            default = { 'lazydev' },
            providers = {
              lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', fallbacks = { 'lsp' } },
            },
          },
        },
      },
    },
    opts = {
      --- @module 'lazydev'
      --- @type lazydev.Library.spec[]
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
}
