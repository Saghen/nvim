return {
	-- {
	-- 	'echasnovski/mini.starter',
	-- 	version = '*',
	-- 	config = function()
	-- 		local starter = require('mini.starter')
	-- 		starter.setup({
	-- 			autoopen = true,
	-- 			evaluate_single = false,
	-- 			items = {
	-- 				{ name = 'Projects', action = 'lua print(math.random())', section = 'Section 1' },
	-- 				{ name = 'Yo', action = 'lua print(math.random())', section = 'Section 1' },
	-- 			},
	-- 			content_hooks = {
	-- 				starter.gen_hook.adding_bullet(),
	-- 				starter.gen_hook.aligning('center', 'center'),
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		'nvimdev/dashboard-nvim',
		dependencies = { 'navarasu/onedark.nvim', 'nvim-tree/nvim-web-devicons' },
		opts = {
			theme = 'hyper',
			config = {
				week_header = {
					enable = true,
				},
				project = {
					action = 'ProjectLoad ',
				},
				shortcut = {
					{
						desc = ' Update',
						group = '@property',
						action = 'Lazy update',
						key = 'u',
					},
					{
						desc = ' Projects',
						group = 'DiagnosticSignWarn',
						action = "lua require('telescope').extensions.projections.projections({})",
						key = 'p',
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
	},
}
