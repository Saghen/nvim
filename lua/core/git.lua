return {
  -- convert git branches/files to remote URLs
  {
    'linrongbin16/gitlinker.nvim',
    cmd = 'GitLink',
    keys = {
      { '<leader>gyf', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = 'Copy file url' },
      { '<leader>gof', '<cmd>GitLink!', mode = { 'n', 'v' }, desc = 'Open file in browser' },

      { '<leader>gob', '<cmd>GitLink current_branch<cr>', mode = { 'n', 'v' }, desc = 'Open branch in browser' },
      { '<leader>gyb', '<cmd>GitLink current_branch<cr>', mode = { 'n', 'v' }, desc = 'Copy branch url' },

      { '<leader>gor', '<cmd>GitLink! default_branch<cr>', mode = { 'n', 'v' }, desc = 'Open repo in browser' },
      { '<leader>gyr', '<cmd>GitLink default_branch<cr>', mode = { 'n', 'v' }, desc = 'Copy repo url' },

      { '<leader>goB', '<cmd>GitLink! blame<cr>', mode = { 'n', 'v' }, desc = 'Open blame in browser' },
    },
    opts = {},
  },

  -- telescope pickers
  {
    'aaronhallaert/advanced-git-search.nvim',
    cmd = 'AdvancedGitSearch',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'sindrets/diffview.nvim',
      'linrongbin16/gitlinker.nvim',
    },
    keys = {
      { '<leader>gsl', '<cmd>AdvancedGitSearch search_log_content_file<cr>', desc = 'Search log content (file)' },
      { '<leader>gsL', '<cmd>AdvancedGitSearch search_log_content<cr>', desc = 'Search log content (repo)' },
      { '<leader>gsdf', '<cmd>AdvancedGitSearch diff_commit_file<cr>', desc = 'Diff with commit (file)' },
      { '<leader>gsdb', '<cmd>AdvancedGitSearch diff_branch_file', 'Diff with branch (file)' },
      { '<leader>gsdl', '<cmd>AdvancedGitSearch diff_commit_line', 'Diff with commit (line)' },
      { '<leader>gsb', '<cmd>AdvancedGitSearch changed_on_branch<cr>', desc = 'Changed on branch' },
      { '<leader>gsc', '<cmd>AdvancedGitSearch checkout_reflog<cr>', desc = 'Checkout via reflog' },
      { '<leader>gsg', '<cmd>AdvancedGitSearch show_custom_functions<cr>', desc = 'Pick a picker' },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          advanced_git_search = {
            show_builtin_git_pickers = true, -- show builtin pickers for show_custom_functions
            browse_command = 'GitLink! rev={commit_hash}',
            diff_plugin = 'diffview',
          },
        },
      })
      require('telescope').load_extension('advanced_git_search')
    end,
  },

  -- main client
  {
    'saghen/neogit',
    branch = 'configurable-popup-kind',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'sindrets/diffview.nvim',
    },
    command = { 'Neogit', 'NeogitCommit', 'NeogitLogCurrent', 'NeogitResetState' },
    keys = {
      -- NOTE: use `b o` in neogit to open PR
      { '<leader>gg', '<cmd>Neogit kind=replace<cr>', desc = 'Open Neogit' },
    },
    opts = {
      -- TODO: seems neat but causes weird flickering with cmdheight=0
      process_spinner = false,
      -- don't scope persisted settings on a per-project basis
      use_per_project_settings = false,
      -- the time after which an output console is shown for slow running commands
      console_timeout = 4000,
      auto_show_console = false, -- TODO: breaks the UI for some reason
      -- graph like https://github.com/rbong/vim-flog
      graph_style = 'unicode',

      commit_editor = {
        kind = 'split',
      },
      popup = {
        kind = 'split',
      },
      mappings = {
        commit_editor = {
          ['<enter>'] = 'Submit',
          ['<backspace>'] = 'Abort',
        },
        status = {
          ['<cr>'] = false,
          ['<leader><cr>'] = 'GoToFile',
        },
      },
    },
  },
}
