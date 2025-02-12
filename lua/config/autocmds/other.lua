local autocmd = vim.api.nvim_create_autocmd

-- Check if we need to reload the file when it changed
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
	callback = function()
		-- Check if file still exists
		if vim.fn.filereadable(vim.fn.expand('%')) == 0 then
			return
		end

		-- Check if file has changed
		vim.cmd('checktime')
	end,
})

-- Highlight on yank
autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last loc when opening a buffer
autocmd('BufReadPost', {
	callback = function(event)
		local exclude = { 'gitcommit' }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].tuque_last_loc then
			return
		end
		vim.b[buf].tuque_last_loc = true

		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
