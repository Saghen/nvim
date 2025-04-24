local map = function(desc, key, command)
  vim.keymap.set('n', key, command, { silent = true, buffer = vim.api.nvim_get_current_buf(), desc = desc })
end

map('Hover', 'K', function() vim.cmd.RustLsp({ 'hover', 'actions' }) end)
map('Rebuild Proc Macros', '<leader>cr', function() vim.cmd.RustLsp('rebuildProcMacros') end)
map('Render Diagnostic', '<leader>cd', function() vim.cmd.RustLsp({ 'renderDiagnostic', 'current' }) end)
