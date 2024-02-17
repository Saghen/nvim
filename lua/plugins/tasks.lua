return {
	{
		'stevearc/overseer.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'stevearc/dressing.nvim',
			'akinsho/nvim-toggleterm.lua',
		},
		keys = {
			{ '<leader>or', '<cmd>OverseerRun<cr> | <cmd>OverseerOpen<cr>', { desc = 'Run task' } },
			{ '<leader>ot', '<cmd>OverseerToggle<cr>', { desc = 'Toggle task runner' } },
			{ '<leader>oo', '<cmd>OverseerOpen<cr>', { desc = 'Open task runner' } },
		},
		opts = {
			strategy = 'toggleterm',
		},
		config = function(_, opts)
			require('overseer').setup(opts)

			local utils = require('utils.cursor')
			-- hack: should be able to get the win_id from overseer api
			-- local win_id = nil
			-- vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
			-- 	callback = function()
			-- 		if vim.bo.filetype == 'OverseerList' then
			-- 			win_id = vim.api.nvim_get_current_win()
			-- 			utils.hideCursor()
			-- 			utils.showCursorLine(win_id)
			-- 		end
			-- 	end,
			-- })
			-- vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
			-- 	callback = function()
			-- 		utils.showCursor()
			-- 		if win_id ~= nil then
			-- 			utils.hideCursorLine(win_id)
			-- 		end
			-- 	end,
			-- })
		end,
	},
	{
		'folke/which-key.nvim',
		opts = function(_, opts)
			table.insert(opts.defaults, {
				['<leader>t'] = { name = '+tasks' },
			})
		end,
	},
}
