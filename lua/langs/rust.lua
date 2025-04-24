return {
  -- autocomplete for cargo.toml
  {
    'saecki/crates.nvim',
    ft = 'toml',
    tag = 'stable',
    opts = {
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
      completion = {
        crates = { enabled = true },
      },
    },
  },

  -- LSP, code actions and a bunch more
  {
    'mrcjkb/rustaceanvim',
    version = '*',
    ft = 'rust',
    dependencies = 'saghen/blink.cmp',
  },
}
