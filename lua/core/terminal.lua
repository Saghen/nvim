return {
  -- nested neovim instances open in the parent
  {
    enabled = os.getenv('NVIM_DEV') == nil,
    'willothy/flatten.nvim',
    version = '*',
    lazy = false,
    priority = 1001,
    opts = {
      callbacks = {
        should_block = function(argv)
          -- adds support for kubectl edit, sops and probably many other tools
          return vim.startswith(argv[#argv], '/tmp') or require('flatten').default_should_block(argv)
        end,
      },
      window = { open = 'smart' },
    },
  },
}
