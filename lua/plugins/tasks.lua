return {
	{
		'stevearc/overseer.nvim',
		event = 'VeryLazy',
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
