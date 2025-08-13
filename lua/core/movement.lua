return {
  -- skip punctuation, subwords
  {
    'chrisgrieser/nvim-spider',
    keys = {
      { 'w', function() require('spider').motion('w') end, mode = { 'n', 'o', 'x' } },
      { 'e', function() require('spider').motion('e') end, mode = { 'n', 'o', 'x' } },
      { 'b', function() require('spider').motion('b') end, mode = { 'n', 'o', 'x' } },
    },
    opts = { subwordMovement = true },
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
}
