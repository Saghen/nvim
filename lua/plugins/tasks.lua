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
		opts = { strategy = 'toggleterm' },
	},
}
