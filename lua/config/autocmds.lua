vim.cmd([[autocmd BufRead,BufNewFile ~/.config/waybar/config set syntax=jsonc]])
vim.cmd([[autocmd BufRead,BufNewFile *.rasi set syntax=css]])

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
	command = 'checktime',
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
	callback = function(event)
		local exclude = { 'gitcommit' }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		'PlenaryTestPopup',
		'help',
		'lspinfo',
		'man',
		'notify',
		'qf',
		'query',
		'spectre_panel',
		'startuptime',
		'tsplayground',
		'neotest-output',
		'checkhealth',
		'neotest-summary',
		'neotest-output-panel',
		'toggleterm',
		'neo-tree',
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
	end,
})
