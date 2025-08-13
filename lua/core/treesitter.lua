return {
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    build = ':TSUpdate',
    --- @module 'nvim-treesitter.configs'
    --- @type TSConfig
    --- @diagnostic disable-next-line: missing-fields
    opts = {
      highlight = { enable = true },
      -- works poorly for lists in yaml and dioxus macros
      indent = {
        enable = false,
        -- enable = function() return vim.bo.ft ~= 'yaml' and vim.bo.ft ~= 'rust' end,
      },
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
