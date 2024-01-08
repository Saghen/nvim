return {
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		config = function()
			require('ibl').setup({
				debounce = 100,
				indent = { char = '▎', tab_char = '▎' },
				whitespace = { remove_blankline_trail = true },
				exclude = {
					filetypes = {
						'dashboard',
						-- defaults
						'lspinfo',
						'packer',
						'checkhealth',
						'help',
						'man',
						'gitcommit',
						'TelescopePrompt',
						'TelescopeResults',
						'',
					},
				},
				scope = {
					-- todo: extremely slow
					enabled = false,
					highlight = {
						'RainbowOrange',
						'RainbowPurple',
						'RainbowBlue',
					},
					exclude = { language = { 'yaml' } },
				},
			})

			local hooks = require('ibl.hooks')
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	{
		'HiPhish/rainbow-delimiters.nvim',
		config = function()
			local rainbow_delimiters = require('rainbow-delimiters')
			require('rainbow-delimiters.setup').setup({
				strategy = {
					[''] = rainbow_delimiters.strategy['global'],
				},
				query = {
					[''] = 'rainbow-delimiters',
				},
				highlight = {
					'RainbowOrange',
					'RainbowPurple',
					'RainbowBlue',
				},
			})
		end,
	},
}
