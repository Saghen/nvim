-- TODO: still necessary?
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
	local default_diagnostic_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, result, context, config)
		if err ~= nil and err.code == -32802 then
			return
		end
		return default_diagnostic_handler(err, result, context, config)
	end
end

-- Keymaps
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', 'K', function()
	vim.cmd.RustLsp({ 'hover', 'actions' })
end, { silent = true, buffer = bufnr, desc = 'Hover' })

vim.keymap.set('n', '<leader>cr', function()
	vim.cmd.RustLsp('rebuildProcMacros')
end, { silent = true, buffer = bufnr, desc = 'Rebuild Proc Macros' })

vim.keymap.set('n', '<leader>cd', function()
	vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
end, { silent = true, buffer = bufnr, desc = 'Render Diagnostic' })

vim.keymap.set('n', '<leader>gd', function()
	vim.cmd.RustLsp('openDocs')
end, { silent = true, buffer = bufnr, desc = 'Open docs.rs documentation' })
