return {
	-- autocomplete
	{
		enabled = os.getenv('NVIM_DEV') == nil,
		'supermaven-inc/supermaven-nvim',
		event = 'InsertEnter',
		opts = {
			keymaps = {
				accept_suggestion = '<M-i>',
			},
			color = {
				-- TODO: use onedark.nvim
				suggestion_color = '#585b70',
			},
			log_level = 'off',
		},
	},

	-- chat with code
	{
		dev = true,
		'olimorris/codecompanion.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
		},
		keys = {
			{ '<leader>aa', '<cmd>CodeCompanionChat<cr>', desc = 'AI Chat' },
		},
		opts = {},
	},
}
