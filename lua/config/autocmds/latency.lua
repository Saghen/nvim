local is_scheduled = false
vim.api.nvim_create_autocmd({
	'BufEnter',
	'BufLeave',
	'BufWrite',
	'FileReadPost',
	'WinEnter',
	'WinLeave',
	'BufWinEnter',
	'TextChanged',
	'TextChangedI',
	'InsertCharPre',
	'CursorMoved',
	'CursorMovedI',
}, {
	callback = function(ev)
		local event = ev.event
		local start_time = vim.loop.hrtime()

		if is_scheduled then
			return
		end
		is_scheduled = true

		vim.schedule(function()
			is_scheduled = false
			local latency_ms = (vim.loop.hrtime() - start_time) / 1e6
			if latency_ms > 4 then
				vim.print(string.format('%s took %.2fms', event, latency_ms))
			end
		end)
	end,
})
