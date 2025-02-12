if os.getenv('NVIM_PROFILE') == 'start' then
	-- example for lazy.nvim
	-- change this to the correct path for your plugin manager
	local snacks = vim.fn.stdpath('data') .. '/lazy/snacks.nvim'
	vim.opt.rtp:append(snacks)
	require('snacks.profiler').startup({
		startup = {
			-- event = 'VimEnter', -- stop profiler on this event. Defaults to `VimEnter`
			-- event = "UIEnter",
			event = 'VeryLazy',
		},
	})
end
