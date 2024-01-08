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
			{ '<leader>or', '<cmd>OverseerRun<cr>', { desc = 'Open task runner' } },
			{ '<leader>ot', '<cmd>OverseerToggle<cr>', { desc = 'Open task runner' } },
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
