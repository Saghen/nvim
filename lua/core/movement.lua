return {
  -- skip punctuation, subwords
  {
    'chrisgrieser/nvim-spider',
    keys = {
      {
        'w',
        function() require('spider').motion('w') end,
        mode = { 'n', 'o', 'x' },
      },
      {
        'e',
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { 'n', 'o', 'x' },
      },
      {
        'b',
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { 'n', 'o', 'x' },
      },
    },
    opts = {
      subwordMovement = true,
    },
  },

  {
    'folke/flash.nvim',
    -- stylua: ignore
    keys = {
      { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "R", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
    opts = {},
  },

  -- tabout
  {
    'kawre/neotab.nvim',
    event = 'InsertEnter',
    --- @module 'neotab'
    opts = {
      behavior = 'nested', ---@type ntab.behavior
      pairs = { ---@type ntab.pair[]
        { open = '(', close = ')' },
        { open = '[', close = ']' },
        { open = '{', close = '}' },
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = '`', close = '`' },
        { open = '<', close = '>' },
      },
      smart_punctuators = {
        enabled = true,
        semicolon = {
          enabled = true,
          ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'rust' },
        },
        escape = {
          enabled = true,
          triggers = { ---@type table<string, ntab.trigger>
            -- [','] = {
            -- 	pairs = {
            -- 		{ open = "'", close = "'" },
            -- 		{ open = '"', close = '"' },
            -- 		{ open = '{', close = '}' },
            -- 		{ open = '[', close = ']' },
            -- 	},
            -- 	format = '%s ', -- ", "
            -- },
            ['='] = {
              pairs = {
                { open = '(', close = ')' },
              },
              ft = { 'javascript', 'typescript' },
              format = ' %s> ', -- ` => `
              -- string.match(text_between_pairs, cond)
              cond = '^$', -- match only pairs with empty content
            },
          },
        },
      },
    },
  },
}
