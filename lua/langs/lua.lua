return {
	-- autocompletion for neovim configuration
	{
		'folke/neodev.nvim',
		opts = { lspconfig = false },
	},
	-- formatting
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			-- fixme: doesn't work
			table.insert(opts.ensure_installed, 'stylua')
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
			},
		},
	},
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'lua' })
			end
		end,
	},
	-- LSP
	{
		'neovim/nvim-lspconfig',
		opts = function()
			return {
				servers = {
					lua_ls = { before_init = require('neodev.lsp').before_init },
				},
			}
		end,
	},
}
