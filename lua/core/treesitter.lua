return {
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    build = ':TSUpdate',
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = { node_incremental = 'v', node_decremental = 'V' },
      },

      auto_install = true,
      -- because they won't be auto-installed but useful in markdown
      ensure_installed = { 'markdown_inline', 'html' },
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
    opts_extend = { 'ensure_installed' },
  },
}
