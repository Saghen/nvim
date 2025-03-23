return {
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = { ensure_installed = { 'nix' } },
	},
	-- LSP/formatting
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.nil_ls = {}

			table.insert(opts.servers.efm.filetypes, 'nix')
			opts.servers.efm.settings.languages.nix = { require('efmls-configs.formatters.nixfmt') }
		end,
	},
}
