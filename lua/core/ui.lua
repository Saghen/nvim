return {
	-- top bar
	{
		'ramilito/winbar.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			icons = true,
			diagnostics = true,
			buf_modified = true,
		},
	},

	-- partition UI elements
	{
		'folke/edgy.nvim',
		event = 'VeryLazy',
		opts = {
			animate = { enabled = false },
			icons = {
				closed = '',
				open = '',
			},
			wo = { winbar = false },
			options = {
				left = { size = 40 },
				right = { size = 80 },
			},
			bottom = {
				'Trouble',
				{ ft = 'qf', title = 'QuickFix' },
				{
					ft = 'help',
					size = { height = 20 },
					-- only show help buffers
					filter = function(buf)
						return vim.bo[buf].buftype == 'help'
					end,
				},
			},
			left = {
				{
					ft = 'neo-tree',
					size = { height = 0.85 },
				},
				{
					title = 'Tasks',
					ft = 'OverseerList',
					size = { height = 10 },
				},
			},
			right = {
				{
					ft = 'toggleterm',
					-- exclude floating windows
					filter = function(_, win)
						return vim.api.nvim_win_get_config(win).relative == ''
					end,
				},
			},
		},
	},

	-- experimental UI
	{
		'folke/noice.nvim',
		dependencies = { 'MunifTanjim/nui.nvim' },
		opts = {
			presets = {
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
			},
			messages = { enabled = false },
			notify = { enabled = false },
			popupmenu = { enabled = false },
			lsp = {
				progress = { enabled = false },
				-- provides signature help while typing
				signature = { enabled = true },
			},
		},
	},

	-- helix-like which key
	{
		enabled = false,
		'echasnovski/mini.clue',
		version = false,
		config = function()
			local clue = require('mini.clue')
			clue.setup({
				triggers = {
					-- Leader triggers
					{ mode = 'n', keys = '<Leader>' },
					{ mode = 'x', keys = '<Leader>' },

					-- Built-in completion
					{ mode = 'i', keys = '<C-x>' },

					-- `g` key
					{ mode = 'n', keys = 'g' },
					{ mode = 'x', keys = 'g' },

					-- Marks
					{ mode = 'n', keys = "'" },
					{ mode = 'n', keys = '`' },
					{ mode = 'x', keys = "'" },
					{ mode = 'x', keys = '`' },

					-- Registers
					{ mode = 'n', keys = '"' },
					{ mode = 'x', keys = '"' },
					{ mode = 'i', keys = '<C-r>' },
					{ mode = 'c', keys = '<C-r>' },

					-- Window commands
					{ mode = 'n', keys = '<C-w>' },

					-- `z` key
					{ mode = 'n', keys = 'z' },
					{ mode = 'x', keys = 'z' },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					clue.gen_clues.builtin_completion(),
					clue.gen_clues.g(),
					clue.gen_clues.marks(),
					clue.gen_clues.registers(),
					clue.gen_clues.windows(),
					clue.gen_clues.z(),
				},

				window = {
					delay = 200,
					config = { border = 'single', width = 40 },
				},
			})
		end,
	},

	-- live feedback for rename
	{
		'smjonas/inc-rename.nvim',
		keys = {
			{
				'<leader>cr',
				function()
					return ':IncRename ' .. vim.fn.expand('<cword>')
				end,
				expr = true,
				desc = 'Rename',
			},
		},
		config = true,
	},

	-- notifications
	{ 'j-hui/fidget.nvim', opts = {} },

	-- colors
	{
		'brenoprata10/nvim-highlight-colors',
		opts = { render = 'virtual', enable_tailwind = true, enable_named_colors = false },
	},

	-- render images
	{ '3rd/image.nvim', opts = {} },
}
