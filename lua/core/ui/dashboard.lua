return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	dependencies = { 'navarasu/onedark.nvim', 'nvim-tree/nvim-web-devicons' },
	config = function(_, opts)
		local c = require('onedark.colors')
		vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = c.blue })

		require('dashboard').setup(opts)
	end,
	opts = {
		theme = 'hyper',
		config = {
			week_header = {
				enable = true,
			},
			shortcut = {
				{
					desc = ' Update',
					group = '@property',
					action = 'Lazy update',
					key = 'u',
				},
				{
					desc = '󰈔 Files',
					group = 'DiagnosticSignWarn',
					action = 'Telescope find_files',
					key = 'f',
				},
				{
					desc = '󱁿 Config',
					group = 'DiagnosticSignHint',
					action = 'cd ~/.config/nvim | Telescope find_files',
					key = 'c',
				},
				{
					desc = '󱞂 notes',
					group = 'DiagnosticSignError',
					action = 'cd ~/notes | ObsidianQuickSwitch',
					key = 'n',
				},
			},
		},
	},
}
