return {
  {
    enabled = os.getenv('NVIM_PROFILE') ~= nil or os.getenv('NVIM_DEV') ~= nil,
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    keys = {
      {
        '<leader>bP',
        function() require('snacks').picker.files({ layout = 'ivy' }) end,
        desc = 'Find Files (snacks)',
      },
    },
    opts = {
      picker = {},
      profiler = {
        filter_mod = {
          ['^vim%.'] = true,
        },
        filter_fn = {
          default = true,
          ['^blink.delimiters%.'] = false,
          ['^blink.indent%.'] = false,
          ['^blink.cmp%.'] = false,
          ['^blink.cmp.completion.windows.render%.'] = false,
          ['blink.cmp.sources.snippets.registry'] = false,

          ['^smart-open%.'] = true,
          ['^telescope%.'] = true,
          ['^which-key%.'] = false,
          ['which-key.buf.get'] = true,
        },
      },
    },
    config = function()
      if os.getenv('NVIM_PROFILE') == vim.NIL then return end

      local Snacks = require('snacks')
      -- Toggle the profiler
      Snacks.toggle.profiler():map('<f1>')
      -- Toggle the profiler highlights
      Snacks.toggle.profiler_highlights():map('<f2>')
    end,
  },
  {
    enabled = os.getenv('NVIM_PROFILE_OLD') ~= nil,
    'stevearc/profile.nvim',
    config = function()
      local should_profile = os.getenv('NVIM_PROFILE_OLD')
      if should_profile then
        local profile = require('profile')
        profile.instrument_autocmds()
        local range = os.getenv('NVIM_PROFILE_OLD')
        if range == '1' or range == 'start' then range = '*' end

        profile.ignore('vim.*')
        profile.ignore('sqlite.db.eval')
        -- profile.ignore('vim.tbl_*')
        -- profile.ignore('vim.shared.*')
        -- profile.ignore('vim._editor.*')
        -- profile.ignore('blink.cmp.windows.lib.render.*')
        -- profile.ignore('blink.cmp.windows.render_item*')
        profile.instrument(range)
        if should_profile:lower():match('^start') then profile.start(range) end
      end

      local function toggle_profile()
        if not should_profile then
          vim.notify('Set NVIM_PROFILE to enable profiling', 'warn')
          return
        end
        local prof = require('profile')
        if prof.is_recording() then
          prof.stop()
          vim.ui.input(
            { prompt = 'Save profile to:', completion = 'file', default = 'profile.json' },
            function(filename)
              if filename then
                prof.export(filename)
                vim.notify(string.format('Wrote %s', filename))
              end
            end
          )
        else
          prof.start('*')
        end
      end
      vim.keymap.set('', '<f1>', toggle_profile)
    end,
  },
}
