return {
	-- auto pairs for JSX
	{
		'windwp/nvim-ts-autotag',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			require('nvim-treesitter.configs').setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
	-- linting/formatting
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				eslint = {},
				biome = {},
				svelte = {},
			},
		},
	},
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				['javascript'] = { 'prettierd' },
				['javascriptreact'] = { 'prettierd' },
				['typescript'] = { 'prettierd' },
				['typescriptreact'] = { 'prettierd' },
				['vue'] = { 'prettierd' },
				['css'] = { 'prettierd' },
				['scss'] = { 'prettierd' },
				['less'] = { 'prettierd' },
				['html'] = { 'prettierd' },
				['json'] = { 'prettierd' },
				['jsonc'] = { 'prettierd' },
				['yaml'] = { 'prettierd' },
				['graphql'] = { 'prettierd' },
				['handlebars'] = { 'prettierd' },
				['svelte'] = { 'prettierd' },
			},
		},
	},
	-- LSP
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

	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			-- fixme: doesn't work
			table.insert(opts.ensure_installed, 'vtsls')
		end,
	},
	-- performs drastically better than tsserver because we can limit the number of entries
	-- todo: shows symbols from node_modules, mitigated via telescope
	{
		'yioneko/nvim-vtsls',
		config = function()
			local opts = require('vtsls').lspconfig
			opts.settings = {
				typescript = {
					preferences = {
						preferTypeOnlyAutoImports = true,
					},
					workspaceSymbols = {
						scope = 'currentProject',
						excludeLibrarySymbols = true,
					},
					tsserver = {
						pluginPaths = {
							-- requires: npm i -g @styled/typescript-styled-plugin typescript-styled-plugin
							-- TODO: Install with mason or some other way
							'~/.local/share/npm/lib/node_modules/@styled/typescript-styled-plugin',
						},
					},
				},
				vtsls = {
					experimental = {
						completion = {
							enableServerSideFuzzyMatch = true,
							entriesLimit = 75,
						},
					},
				},
			}
			require('lspconfig').vtsls.setup(opts)
		end,
	},
	-- provides TSC command and diagnostics in editor
	{ 'dmmulroy/tsc.nvim', config = true },
}
