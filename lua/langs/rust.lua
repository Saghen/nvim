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
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'rust' })
			end
		end,
	},

	-- LSP, code actions and a bunch more
	{
		'mrcjkb/rustaceanvim',
		-- dev = true,
		-- version = '*',
		ft = 'rust',
		dependencies = { 'saghen/blink.cmp' },
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
