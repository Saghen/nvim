return {
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = { ensure_installed = { 'bash', 'css', 'cpp' } },
	},
	-- lsp
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				bashls = {},
				clangd = {},
			},
		},
	},
}
