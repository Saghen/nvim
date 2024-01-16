return {
	-- provides border coloring when active like bspwm
	-- fixme: stutters when switching windows
	-- todo: must define the highlight
	-- {
	-- 	'nvim-zh/colorful-winsep.nvim',
	-- 	opts = {
	-- 		highlight = { link = 'WinSeparatorActive' },
	-- 		interval = 10,
	-- 		no_exec_files = { 'lazy', 'TelescopePrompt', 'mason' },
	-- 		symbols = { '─', '│', '┌', '┐', '└', '┘' },
	-- 	},
	-- 	event = { 'WinNew' },
	-- },
	-- manages windows by buffer type
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
					size = { height = 4 },
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
}
