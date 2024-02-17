return {
	enabled = false,
	'stevearc/aerial.nvim',
	lazy = false,
	keys = {
		{ '<leader>a', '<cmd>AerialOpen<cr>', desc = 'Open Symbols (Aerial)' },
		{ '<leader>A', '<cmd>AerialToggle<cr>', desc = 'Toggle Symbols (Aerial)' },
	},
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		-- Priority list of preferred backends for aerial.
		-- This can be a filetype map (see :help aerial-filetype-map)
		backends = { 'lsp', 'treesitter', 'markdown', 'man' },
		-- Determines how the aerial window decides which buffer to display symbols for
		--   window - aerial window will display symbols for the buffer in the window from which it was opened
		--   global - aerial window will display symbols for the current window
		attach_mode = 'global',
		layout = {
			max_width = 40,
			min_width = 40,
			-- set border highlight
			win_opts = {
				cursorline = false,
				winhighlight = 'Normal:NeoTreeNormal,NormalFloat:AerialNormalFloat,EndOfBuffer:AerialNormal,WinSeparator:AerialWinSeparator',
			},
		},
		icons = require('utils.kinds'),
		open_automatic = false,
		highlight_on_jump = false,
		filter_kind = {
			'Class',
			'Constructor',
			'Enum',
			'Function',
			'Interface',
			'Module',
			'Method',
			'Struct',
			'TypeParameter',
			'Variable',
		},
		post_parse_symbol = function(_, item)
			if item.kind == 'TypeParameter' or item.kind == 'Variable' then
				return item.level == 0
			end
			return true
		end,
		on_attach = function(bufnr)
			-- Jump forwards/backwards
			vim.keymap.set('n', '(', '<cmd>AerialPrev<CR>', { buffer = bufnr })
			vim.keymap.set('n', ')', '<cmd>AerialNext<CR>', { buffer = bufnr })
		end,
		-- The autocmds that trigger symbols update (not used for LSP backend)
		update_events = 'TextChanged,InsertLeave,BufEnter',
	},
	config = function(_, opts)
		require('aerial').setup(opts)
		-- disable the cursorline when not focused
		-- vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter' }, {
		-- 	callback = function()
		-- 		local window = vim.api.nvim_get_current_win()
		-- 		local buf = vim.api.nvim_win_get_buf(window)
		-- 		local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
		-- 		if filetype == 'aerial' then
		-- 			vim.cmd('setlocal cursorline')
		-- 		end
		-- 	end,
		-- })
		-- vim.api.nvim_create_autocmd({ 'WinLeave' }, {
		-- 	callback = function()
		-- 		local window = vim.api.nvim_get_current_win()
		-- 		local buf = vim.api.nvim_win_get_buf(window)
		-- 		local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
		-- 		if filetype == 'aerial' then
		-- 			vim.cmd('setlocal nocursorline')
		-- 		end
		-- 	end,
		-- })
	end,
}
