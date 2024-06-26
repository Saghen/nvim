return {
	-- pick venv (supports all major managers)
	{
		'linux-cultist/venv-selector.nvim',
		cmd = 'VenvSelect',
		opts = {
			dap_enabled = false,
			name = {
				'venv',
				'.venv',
				'env',
				'.env',
			},
		},
		keys = { { '<leader>cv', '<cmd>:VenvSelect<cr>', desc = 'Select VirtualEnv' } },
	},
	-- formatting
	{
		'stevearc/conform.nvim',
		opts = {
			-- todo: switch to ruff
			formatters_by_ft = { ['python'] = { 'black' } },
		},
	},
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'python', 'ninja' })
			end
		end,
	},
	-- LSP
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				pyright = {},
				ruff_lsp = {
					keys = {
						{
							'<leader>co',
							function()
								vim.lsp.buf.code_action({
									apply = true,
									context = {
										only = { 'source.organizeImports' },
										diagnostics = {},
									},
								})
							end,
							desc = 'Organize Imports',
						},
					},
				},
			},
			setup = {
				ruff_lsp = function()
					require('lazyvim.util').lsp.on_attach(function(client, _)
						if client.name == 'ruff_lsp' then
							-- Disable hover in favor of Pyright
							client.server_capabilities.hoverProvider = false
						end
					end)
				end,
			},
		},
	},
}
