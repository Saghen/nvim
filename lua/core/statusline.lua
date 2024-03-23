return {
	'nvim-lualine/lualine.nvim',
	event = 'VeryLazy',
	opts = {
		options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		-- todo: add cwd and filename
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { { 'filename', path = 1 } },
			lualine_z = { { 'filetype', colored = false } },
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
