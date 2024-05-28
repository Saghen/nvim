return {
	-- project and session management
	{
		'coffebar/neovim-project',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'Shatur/neovim-session-manager',
			'nvim-telescope/telescope.nvim',
		},
		keys = {
			{ '<leader>fp', '<cmd>Telescope neovim-project discover<cr>', desc = 'Projects' },
		},
		init = function()
			-- enable saving the state of plugins in the session
			vim.opt.sessionoptions:append('globals') -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		end,
		opts = {
			dashboard_mode = true, -- prevent session autoload
			projects = {
				-- projects
				'~/code/huggingface/*',
				'~/code/huggingface/tokenizers/*',
				'~/code/huggingface/spaces/*',
				'~/code/liqwid/*',
				'~/code/nvim/*',
				'~/code/oz/*',
				'~/code/personal/*',
				'~/code/superfishial/*',

				-- dotfiles
				'/etc/nixos',
				'~/.config/*',
			},

			session_manager_opts = {
				autosave_ignore_buftypes = { 'nowrite' },
			},
		},
	},
}
