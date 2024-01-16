return {
	'nvim-lualine/lualine.nvim',
	event = 'VeryLazy',
	dependencies = 'SmiteshP/nvim-navic',
	opts = {
		options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				-- todo: measure performance
				statusline = 300,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = {},
			lualine_x = { 'filetype' },
			lualine_y = { 'progress' },
			lualine_z = { 'location' },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
