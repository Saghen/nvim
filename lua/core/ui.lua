return {
	-- command fuzzy finder
	{
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
		config = function()
			-- local c = require('onedark.colors')
			-- local api = vim.api
			--
			-- api.nvim_set_hl(0, 'NormalMode', { fg = c.green })
			-- api.nvim_set_hl(0, 'InsertMode', { fg = c.blue })
			-- api.nvim_set_hl(0, 'VisualMode', { fg = c.purple })
			-- api.nvim_set_hl(0, 'ReplaceMode', { fg = c.red })
			-- api.nvim_set_hl(0, 'CommandMode', { fg = c.yellow })

			require('modicator').setup({
				highlights = {
					defaults = { bold = true },
				},
			})
		end,
	},
}
