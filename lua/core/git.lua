return {
	-- blame
	{
		'f-person/git-blame.nvim',
		init = function()
			vim.g.gitblame_delay = 1000
			vim.g.gitblame_set_extmark_options = {
				hl_mode = 'combine',
			}
			vim.g.gitblame_date_format = '%r'
			vim.g.gitblame_highlight_group = 'GitBlameVirtText'
		end,
	},

	-- show git status for lines on the left side of the buffer
	'lewis6991/gitsigns.nvim',

	-- client
	{
		'NeogitOrg/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'sindrets/diffview.nvim',
		},
		keys = {
			{ '<leader>gg', '<cmd>Neogit kind=replace<cr>', desc = 'Open Neogit' },
		},
		config = true,
	},

	-- highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(
					opts.ensure_installed,
					{ 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore' }
				)
			end
		end,
	},
}
