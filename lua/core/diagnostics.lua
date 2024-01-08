-- define icons for the diagnostics in the sign column
-- even though we have them disabled
vim.fn.sign_define('DiagnosticSignError', { texthl = 'DiagnosticSignError', text = '' })
vim.fn.sign_define('DiagnosticSignWarn', { texthl = 'DiagnosticSignWarn', text = '' })
vim.fn.sign_define('DiagnosticSignHint', { texthl = 'DiagnosticSignHint', text = '' })
vim.fn.sign_define('DiagnosticSignInfo', { texthl = 'DiagnosticSignInfo', text = '' })

return {
	{
		'folke/todo-comments.nvim',
		opts = {
			keywords = {
				FIX = {
					icon = ' ',
					color = 'error',
					alt = { 'fix', 'FIXME', 'fixme', 'BUG', 'bug', 'FIXIT', 'fixit', 'ISSUE', 'issue' },
				},
				TODO = { icon = ' ', color = 'info', alt = { 'todo' } },
				HACK = { icon = ' ', color = 'warning', alt = { 'hack' } },
				WARN = { icon = ' ', color = 'warning', alt = { 'warn', 'WARNING', 'warning', 'XXX', 'xxx' } },
				PERF = {
					icon = ' ',
					alt = { 'perf', 'OPTIM', 'optim', 'PERFORMANCE', 'performance', 'OPTIMIZE', 'optimize' },
				},
				NOTE = { icon = ' ', color = 'hint', alt = { 'note', 'INFO', 'info' } },
				TEST = {
					icon = '⏲ ',
					color = 'test',
					alt = { 'test', 'TESTING', 'testing', 'PASSED', 'passed', 'FAILED', 'failed' },
				},
			},
		},
	},

	{
		'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
		lazy = false,
		keys = {
			{
				'<leader>ud',
				function()
					vim.g.lsp_lines_active = not vim.g.lsp_lines_active
					vim.diagnostic.config({
						virtual_text = not vim.g.lsp_lines_active,
						virtual_lines = vim.g.lsp_lines_active,
					})
				end,
				desc = 'Toggle Verbose Diagnostics',
			},
		},
		init = function()
			vim.g.lsp_lines_active = false
			vim.diagnostic.config({
				-- disable the "E", "H" in the sign column (left of line numbers)
				signs = false,
				virtual_text = true,
				virtual_lines = false,
			})
			-- avoid showing lsp lines on lazy.nvim popup
			-- https://github.com/folke/lazy.nvim/issues/620
			vim.diagnostic.config({ virtual_lines = false }, require('lazy.core.config').ns)
		end,
		config = true,
	},
}
