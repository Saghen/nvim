return {
	'kndndrj/nvim-dbee',
	dependencies = { 'MunifTanjim/nui.nvim' },
	keys = {
		{
			'<leader>id',
			function()
				require('dbee').toggle()
			end,
			desc = 'Open DBee',
		},
	},
	build = function()
		require('dbee').install()
	end,
	opts = {},
}
