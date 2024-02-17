return {
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'yaml' })
			end
		end,
	},
	-- LSP and schemas for autocompletion
	{ 'towolf/vim-helm', event = 'VeryLazy' },
	{
		'someone-stole-my-name/yaml-companion.nvim',
		ft = 'yaml',
		dependencies = {
			{ 'neovim/nvim-lspconfig' },
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope.nvim' },
		},
		keys = {
			{ '<leader>fy', '<cmd>Telescope yaml_schema<CR>', desc = 'YAML Schemas' },
		},
		config = function()
			local cfg = require('yaml-companion').setup()
			require('lspconfig').yamlls.setup(cfg)
			require('lspconfig').helm_ls.setup({
				settings = {
					['helm-ls'] = {
						yamlls = {
							path = 'yaml-language-server',
						},
					},
				},
			})
			-- require('telescope').load_extension('yaml_schema')
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			table.insert(opts.ensure_installed, 'yaml-language-server')
			table.insert(opts.ensure_installed, 'helm-ls')
		end,
	},
}
