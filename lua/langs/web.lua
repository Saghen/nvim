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
			},
		},
	},
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				-- ['javascript'] = { 'biome' },
				-- ['javascriptreact'] = { 'biome' },
				-- ['typescript'] = { 'biome' },
				-- ['typescriptreact'] = { 'biome' },
				-- ['vue'] = { 'biome' },
				-- ['css'] = { 'biome' },
				-- ['scss'] = { 'biome' },
				-- ['less'] = { 'biome' },
				-- ['html'] = { 'biome' },
				-- ['json'] = { 'biome' },
				-- ['jsonc'] = { 'biome' },
				-- ['yaml'] = { 'biome' },
				-- ['graphql'] = { 'biome' },
				-- ['handlebars'] = { 'biome' },
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
			},
		},
	},
	-- LSP
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'typescript', 'tsx', 'javascript', 'jsdoc', 'css', 'html' })
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
	-- debugging
	{
		'microsoft/vscode-js-debug',
		version = 'v1.*',
		build = 'npm ci --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
	},
	{
		'mxsdev/nvim-dap-vscode-js',
		dependencies = { 'mfussenegger/nvim-dap' },
		config = function()
			require('dap-vscode-js').setup({
				debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
				adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
			})
			local js_languages = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' }
			-- todo: doesnt seem to work
			require('dap.ext.vscode').load_launchjs(nil, {
				['pwa-node'] = js_languages,
				['node'] = js_languages,
				['chrome'] = js_languages,
				['pwa-chrome'] = js_languages,
			})
			for _, language in ipairs(js_languages) do
				require('dap').configurations[language] = {
					{
						type = 'pwa-node',
						request = 'launch',
						name = 'Launch file',
						program = '${file}',
						cwd = '${workspaceFolder}',
					},
					{
						type = 'pwa-node',
						request = 'attach',
						name = 'Attach',
						processId = require('dap.utils').pick_process,
						cwd = '${workspaceFolder}',
					},
					{
						type = 'pwa-chrome',
						request = 'launch',
						name = 'Start Chrome with "localhost"',
						url = 'http://localhost:3000',
						webRoot = '${workspaceFolder}',
						-- required for logging into google
						userDataDir = false,
						-- userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
					},
				}
			end
		end,
	},
	-- provides TSC command and diagnostics in editor
	{ 'dmmulroy/tsc.nvim', config = true },
}

-- performs better that typescript-tools because it limits the number of entries
-- sent to neovim. however, it doesn't support styled components and many quick
-- fixes. ideally, we combine the best of both worlds
