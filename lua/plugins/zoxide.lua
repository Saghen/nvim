return {
	{
		'jvgrootveld/telescope-zoxide',
		event = 'VeryLazy',
		keys = {
			{ '<leader>fz', "<cmd>lua require('telescope').extensions.zoxide.list()<cr>", desc = 'Z' },
		},
		config = function()
			require('telescope').load_extension('zoxide')
		end,
	},
}
