return {
	{
		'folke/edgy.nvim',
		event = 'VeryLazy',
		opts = {
			animate = {
				enabled = false,
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
				{ ft = 'spectre_panel', size = { height = 0.4 } },
			},
			left = {
				{
					ft = 'neo-tree',
					filter = function(buf)
						return vim.b[buf].neo_tree_source == 'filesystem'
					end,
					size = { height = 0.85 },
				},
				{
					title = 'Tasks',
					ft = 'OverseerList',
					size = { height = 3 },
				},
				{
					title = 'Symbols',
					ft = 'aerial',
					size = { height = 6 },
				},
			},
			right = {
				{
					ft = 'toggleterm',
					-- exclude floating windows
					filter = function(buf, win)
						return vim.api.nvim_win_get_config(win).relative == ''
					end,
				},
			},
		},
	},
}
