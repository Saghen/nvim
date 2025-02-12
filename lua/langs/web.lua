-- todo: uses biome when available, fallback to prettierd
local choose_formatter = function()
	local cwd = vim.fn.getcwd()
	local has_biome = vim.fn.filereadable(cwd .. '/biome.json')
	return has_biome == 1 and { require('efmls-configs.formatters.biome') }
		or { require('efmls-configs.formatters.prettier_d') }
end

return {
	-- auto pairs for JSX
	{
		'windwp/nvim-ts-autotag',
		ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {},
	},

	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, {
					'typescript',
					'tsx',
					'javascript',
					'purescript',
					'jsdoc',
					'css',
					'scss',
					'html',
				})
			end
		end,
	},

	-- linting/formatting
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.cssls = {}
			opts.servers.vtsls = {}
			-- opts.servers.eslint = {}
			-- opts.servers.biome = {}

			-- formatting
			vim.list_extend(opts.servers.efm.filetypes, {
				'javascript',
				'javascriptreact',
				'typescript',
				'typescriptreact',
				'css',
				'scss',
				'less',
				'html',
				'json',
				'jsonc',
				'yaml',
				'graphql',
				'handlebars',
				'svelte',
			})
			opts.servers.efm.settings.languages.javascript = choose_formatter()
			opts.servers.efm.settings.languages.javascriptreact = choose_formatter()
			opts.servers.efm.settings.languages.typescript = choose_formatter()
			opts.servers.efm.settings.languages.typescriptreact = choose_formatter()
			opts.servers.efm.settings.languages.css = choose_formatter()
			opts.servers.efm.settings.languages.scss = choose_formatter()
			opts.servers.efm.settings.languages.less = choose_formatter()
			opts.servers.efm.settings.languages.html = choose_formatter()
			opts.servers.efm.settings.languages.json = choose_formatter()
			opts.servers.efm.settings.languages.jsonc = choose_formatter()
			opts.servers.efm.settings.languages.yaml = choose_formatter()
			opts.servers.efm.settings.languages.graphql = choose_formatter()
			opts.servers.efm.settings.languages.handlebars = choose_formatter()
			opts.servers.efm.settings.languages.svelte = choose_formatter()
		end,
	},
}
