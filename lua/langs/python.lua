return {
	-- pick venv (supports all major managers)
	{
		'linux-cultist/venv-selector.nvim',
		branch = 'regexp',
		cmd = 'VenvSelect',
		opts = {
			-- todo: custom queries and disable built in because slow
			-- todo: hook into sessions to auto load venv
			-- todo: requires manually restarting LSPs so should happen automatically
			settings = {
				search = {
					root = {
						command = 'echo ~/.venv/bin/python',
					},
				},
			},
		},
		keys = { { '<leader>cv', '<cmd>:VenvSelect<cr>', desc = 'Select VirtualEnv' } },
	},
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = { ensure_installed = { 'python', 'ninja' } },
	},
	-- LSP/formatting
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.basedpyright = {}

			table.insert(opts.servers.efm.filetypes, 'python')
			opts.servers.efm.settings.languages.python = { require('efmls-configs.formatters.black') }
		end,
	},
}
