return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'mrcjkb/rustaceanvim',
  },
  keys = {
    {
      '<leader>tr',
      function() require('neotest').run.run() end,
      desc = 'Run nearest test',
    },
    {
      '<leader>ts',
      function() require('neotest').run.stop() end,
    },
  },
  config = function()
    --- @diagnostic disable-next-line: missing-fields
    require('neotest').setup({
      adapters = { require('rustaceanvim.neotest') },
    })
  end,
}
