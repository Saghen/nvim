return {
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				---@diagnostic disable-next-line: missing-parameter
				vim.list_extend(opts.ensure_installed, { 'bash', 'css', 'cpp' })
			end
		end,
	},
	-- lsp
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				bashls = {},
				pyright = {},
				eslint = {},
				clangd = {},
			},
		},
	},
}
