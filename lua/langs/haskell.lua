return {
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = { ensure_installed = { 'haskell' } },
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				hls = {},
			},
		},
	},
}
