-- When switching to a new buffer, create a split to the right of the current window
-- or use the existing split if it's already there. If we're in the window on the right,
-- we use the split to the left. We ignore any windows that are of special filetypes.
--
-- We set the split's buffer to the previous buffer

vim.g.revision = 4
vim.api.nvim_create_autocmd('BufWinEnter', {
	callback = function(event)
		if vim.g.revision ~= 4 then
			return
		end

		local cur_win = vim.api.nvim_get_current_win()
		local cur_buf = event.buf

		local wins = vim.api.nvim_list_wins()

		-- List of filetypes to ignore
		local ignore_fts = {
			'blink-tree',
			'qf',
			'help',
			'toggleterm',
		}
		if vim.tbl_contains(ignore_fts, vim.bo[cur_buf].filetype) or vim.bo[cur_buf].buftype ~= '' then
			return
		end

		-- Find adjacent window
		local adjacent_win = nil
		for _, win in ipairs(wins) do
			if win == cur_win then
				goto continue
			end

			local buf = vim.api.nvim_win_get_buf(win)
			if vim.tbl_contains(ignore_fts, vim.bo[buf].filetype) or vim.bo[buf].buftype ~= '' then
				goto continue
			end

			local win_pos = vim.api.nvim_win_get_position(win)
			local cur_pos = vim.api.nvim_win_get_position(cur_win)

			-- Check if window is directly to left/right
			if win_pos[1] == cur_pos[1] then
				adjacent_win = win
				break
			end

			::continue::
		end

		-- Create new split if no adjacent window exists
		if not adjacent_win then
			vim.cmd('vsplit')
			adjacent_win = vim.api.nvim_get_current_win()
		end

		-- Set buffer in adjacent window to previous buffer
		vim.api.nvim_win_set_buf(adjacent_win, vim.fn.bufnr('#'))
	end,
})
