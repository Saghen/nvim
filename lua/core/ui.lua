return {
	{
		'folke/edgy.nvim',
		event = 'VeryLazy',
		opts = {
			animate = {
				enabled = false,
			},
			icons = {
				closed = '',
				open = '',
			},
			wo = {
				winbar = true,
				-- StatusLineNC fixes the highlighting on the title when not focused
				winhighlight = 'WinBar:EdgyWinBar,Normal:EdgyNormal,StatusLineNC:EdgyWinBar',
			},
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
					title = 'Symbols',
					ft = 'aerial',
					size = { height = 9 },
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

	-- command fuzzy finder
	{
		enabled = false,
		'mrjones2014/legendary.nvim',
		-- sqlite is only needed if you want to use frecency sorting
		dependencies = {
			'kkharji/sqlite.lua',
			'nvim-telescope/telescope.nvim',
			'stevearc/dressing.nvim',
		},
		-- since legendary.nvim handles all your keymaps/commands,
		-- its recommended to load legendary.nvim before other plugins
		priority = 10000,
		lazy = false,
		keys = { { '<leader>P', '<cmd>Legendary<cr>', desc = 'Command Palette' } },
		opts = { extensions = { lazy_nvim = true } },
	},

	-- experimental UI
	{
		'folke/noice.nvim',
		dependencies = { 'MunifTanjim/nui.nvim' },
		opts = {
			presets = {
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
			},
			notify = { enabled = false },
			popupmenu = { backend = 'cmp' },
			lsp = {
				progress = { enabled = false },
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['cmp.entry.get_documentation'] = true,
				},
			},
		},
	},
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

	-- show mode color in line numbers
	{
		'mawkler/modicator.nvim',
		dependencies = { 'navarasu/onedark.nvim' },
		opts = {
			highlights = {
				defaults = { bold = true },
			},
		},
	},
}
