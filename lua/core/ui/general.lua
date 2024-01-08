return {
	-- todo: SLOW
	-- {
	-- 	'nvim-treesitter/nvim-treesitter-context',
	-- 	lazy = false,
	-- 	dependencies = 'nvim-treesitter/nvim-treesitter',
	-- 	keys = {
	-- 		{ '<leader>uc', '<cmd>TSContextToggle<cr>', desc = 'Toggle Treesitter Context' },
	-- 	},
	-- 	config = true,
	-- },

	-- experimental UI
	{
		'folke/noice.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
			-- 'rcarriga/nvim-notify',
		},
		opts = {
			presets = {
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
			},
			notify = {
				enabled = false,
			},
			lsp = {
				progress = {
					enabled = false,
				},
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['cmp.entry.get_documentation'] = true,
				},
			},
		},
	},

	-- notifications
	-- todo: spams "Completed Diagnosing" in lua when typing
	{
		'j-hui/fidget.nvim',
		opts = {},
	},

	-- show mode color in line numbers
	{
		'mawkler/modicator.nvim',
		dependencies = { 'navarasu/onedark.nvim' },
		config = function()
			local c = require('onedark.colors')
			local api = vim.api

			api.nvim_set_hl(0, 'NormalMode', { fg = c.green })
			api.nvim_set_hl(0, 'InsertMode', { fg = c.blue })
			api.nvim_set_hl(0, 'VisualMode', { fg = c.purple })
			api.nvim_set_hl(0, 'ReplaceMode', { fg = c.red })
			api.nvim_set_hl(0, 'CommandMode', { fg = c.yellow })

			require('modicator').setup({
				highlights = {
					defaults = { bold = true },
				},
			})
		end,
	},
}
