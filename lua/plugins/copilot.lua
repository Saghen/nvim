return {
	{
		'zbirenbaum/copilot.lua',
		build = ':Copilot auth',
		opts = {
			suggestion = {
				enabled = true,
				debounce = 50,
				auto_trigger = true,
				keymap = {
					accept = '<M-i>',
				},
			},
			panel = { enabled = false },
			filetypes = { yaml = true },
		},
	},
	{ 'AndreM222/copilot-lualine' },
	{
		'nvim-lualine/lualine.nvim',
		optional = true,
		event = 'VeryLazy',
		opts = function(_, opts)
			local theme = require('onedark.colors')
			table.insert(opts.sections.lualine_x, 1, {
				'copilot',
				show_colors = true,
				symbols = {
					status = {
						hl = {
							enabled = theme.fg,
							disabled = theme.grey,
							warning = theme.yellow,
							unknown = theme.red,
						},
						spinner_color = theme.blue,
					},
				},
			})
		end,
	},
}
