return {
	-- autocomplete for cargo.toml
	{
		'saecki/crates.nvim',
		ft = 'toml',
		tag = 'stable',
		opts = {
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
			completion = {
				crates = { enabled = true },
			},
		},
	},

	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = { ensure_installed = { 'rust' } },
	},

	-- LSP, code actions and a bunch more
	{
		'mrcjkb/rustaceanvim',
		dev = true,
		ft = 'rust',
		dependencies = 'saghen/blink.cmp',
	},

	-- formatting
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			table.insert(opts.servers.efm.filetypes, 'rust')
			opts.servers.efm.settings.languages.rust = { require('efmls-configs.formatters.rustfmt') }
		end,
	},
}
