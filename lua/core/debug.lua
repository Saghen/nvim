return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
      -- Configure debug adapters
      local dap = require('dap')
      dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = vim.g.cpptools_debugger_path,
      }
    end,
  },
  {
    -- TODO: breaks <CR>
    -- TODO: cursor doesn't update when in debug mode moving from tree to code
    enabled = false,
    'miroshQa/debugmaster.nvim',
    keys = {
      { '<leader>d', function() require('debugmaster').mode.toggle() end, mode = { 'n', 'v' }, desc = 'Debug' },
    },
  },
}
