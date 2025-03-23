return {
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = { ensure_installed = { 'go', 'gomod', 'gosum', 'gotmpl', 'gowork' } },
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				gopls = {},
			},
		},
	},
}
