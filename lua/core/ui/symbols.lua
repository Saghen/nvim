return {
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
		-- Determines how the aerial window decides which buffer to display symbols for
		--   window - aerial window will display symbols for the buffer in the window from which it was opened
		--   global - aerial window will display symbols for the current window
		attach_mode = 'global',
		layout = {
			max_width = 40,
			min_width = 40,
			resize_to_content = false,
		},
		on_attach = function(bufnr)
			-- Jump forwards/backwards
			vim.keymap.set('n', '(', '<cmd>AerialPrev<CR>', { buffer = bufnr })
			vim.keymap.set('n', ')', '<cmd>AerialNext<CR>', { buffer = bufnr })
		end,
	},
}
