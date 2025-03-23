local buffer_history = {}
local history_length = 5

local function trim_and_filter_dead()
	buffer_history = vim.tbl_filter(function(buf)
		return vim.api.nvim_buf_is_valid(buf)
	end, buffer_history)

	while #buffer_history > history_length do
		table.remove(buffer_history, history_length + 1)
	end
end

--- @param buf number
local function add_to_history(buf)
	-- Ignore special buffers
	if vim.bo[buf].buftype ~= '' or vim.bo[buf].buflisted == false then
		return
	end

	-- Remove the buffer if it's already in history
	for i, v in ipairs(buffer_history) do
		if v == buf then
			table.remove(buffer_history, i)
			break
		end
	end

	table.insert(buffer_history, 1, buf)
	trim_and_filter_dead()
end

vim.api.nvim_create_autocmd('BufEnter', {
	callback = function(evt)
		add_to_history(evt.buf)
	end,
})

--- @param n number
local function get_nth_previous_buffer(n)
	trim_and_filter_dead()

	-- Add 1 if the requested buffer is the current buffer
	local current_buf = vim.api.nvim_get_current_buf()
	if current_buf == buffer_history[n] then
		n = n + 1
	end

	return buffer_history[n]
end

--- @class tuque.BufferHistory
return { get_nth_previous_buffer = get_nth_previous_buffer }
