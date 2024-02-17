local M = {}

M.hideCursor = function()
	vim.cmd([[
		      setlocal guicursor=n:block-Cursor
		      hi Cursor blend=100
		    ]])
end
M.showCursor = function()
	vim.cmd([[
		      setlocal guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
		      hi Cursor blend=0
		    ]])
end

M.hideCursorLine = function(win)
	vim.api.nvim_set_option_value('cursorline', false, { win = win })
end
M.showCursorLine = function(win)
	vim.api.nvim_set_option_value('cursorline', true, { win = win })
end

return M
