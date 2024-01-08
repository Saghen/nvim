return {
	'stevearc/conform.nvim',
	lazy = false,
	dependencies = { 'mason.nvim' },
	keys = {
		{
			'<leader>cf',
			function()
				require('conform').format({ async = true, lsp_fallback = false })
			end,
			desc = 'Format',
			mode = { 'n', 'v' },
		},
		{
			'<leader>uf',
			function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat or true
			end,
			desc = 'Toggle format on save',
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { async = true, lsp_fallback = false }
		end,
		formatters_by_ft = {},
	},
}
