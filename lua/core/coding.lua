return {
	{ 'echasnovski/mini.ai', opts = {} },

	{
		'Wansmer/treesj',
		keys = {
			{ 'gm', '<cmd>TSJToggle<cr>', desc = 'Toggle Block' },
			{ 'gj', '<cmd>TSJJoin<cr>', desc = 'Join Block' },
			{ 'gp', '<cmd>TSJSplit<cr>', desc = 'Split Block' },
		},
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = { use_default_keymap = false, max_join_length = 1000 },
	},

	-- support comment strings for different treesitter node types (i.e. JSX) and fixes terraform
	{ 'folke/ts-comments.nvim', event = 'VeryLazy', opts = {} },

	-- todo: fork to support limitting filetypes via lua or contribute
	{ 'echasnovski/mini.cursorword', version = false, opts = { delay = 400 } },
	{
		'echasnovski/mini.surround',
		version = '*',
		keys = {
			{ 'sa', desc = 'Add surrounding', mode = { 'n', 'v' } },
			{ 'sd', desc = 'Delete surrounding' },
			{ 'sf', desc = 'Find right surrounding' },
			{ 'sF', desc = 'Find left surrounding' },
			{ 'sh', desc = 'Highlight surrounding' },
			{ 'sr', desc = 'Replace surrounding' },
		},
		opts = {
			-- Number of lines within which surrounding is searched
			n_lines = 50,
			mappings = {
				add = 'sa', -- Add surrounding in Normal and Visual modes
				delete = 'sd', -- Delete surrounding
				find = 'sf', -- Find surrounding (to the right)
				find_left = 'sF', -- Find surrounding (to the left)
				highlight = 'sh', -- Highlight surrounding
				replace = 'sr', -- Replace surrounding
			},
		},
	},
	{
		'echasnovski/mini.bufremove',
		keys = {
			{
				'<leader>bd',
				function()
					local bd = require('mini.bufremove').delete
					if vim.bo.modified then
						local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = 'Delete Buffer',
			},
			{
				'<leader>bD',
				function()
					require('mini.bufremove').delete(0, true)
				end,
				desc = 'Delete Buffer (Force)',
			},
		},
	},
}
