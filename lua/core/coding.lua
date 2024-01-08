return {
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
	{
		'numToStr/Comment.nvim',
		version = '*',
		dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
		opts = function()
			return {
				-- Adds suppors for TSX
				pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
				-- LHS of toggle mappings in NORMAL mode
				toggler = {
					-- Line-comment toggle keymap
					line = 'gcc',
					-- Block-comment toggle keymap
					block = 'gbc',
				},
				-- LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = {
					-- Line-comment keymap
					line = 'gc',
					-- Block-comment keymap
					block = 'gb',
				},
				-- LHS of extra mappings
				extra = {
					-- Add comment on the line above
					above = 'gcO',
					-- Add comment on the line below
					below = 'gco',
					-- Add comment at the end of line
					eol = 'gcA',
				},
				-- Enable keybindings
				-- NOTE: If given `false` then the plugin won't create any mappings
				mappings = {
					-- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
					basic = true,
					-- Extra mapping; `gco`, `gcO`, `gcA`
					extra = true,
				},
			}
		end,
	},

	{
		'RRethy/vim-illuminate',
		version = '*',
		opts = {
			filetypes_denylist = {
				'dirbuf',
				'dirvish',
				'fugitive',
				'neo-tree',
			},
		},
		config = function(_, opts)
			require('illuminate').configure(opts)
		end,
	},
	{ 'echasnovski/mini.pairs', version = '*', config = true },
	{
		'echasnovski/mini.surround',
		version = '*',
		keys = {
			{ 'gsa', desc = 'Add surrounding', mode = { 'n', 'v' } },
			{ 'gsd', desc = 'Delete surrounding' },
			{ 'gsf', desc = 'Find right surrounding' },
			{ 'gsF', desc = 'Find left surrounding' },
			{ 'gsh', desc = 'Highlight surrounding' },
			{ 'gsr', desc = 'Replace surrounding' },
		},
		opts = {
			mappings = {
				add = 'gsa', -- Add surrounding in Normal and Visual modes
				delete = 'gsd', -- Delete surrounding
				find = 'gsf', -- Find surrounding (to the right)
				find_left = 'gsF', -- Find surrounding (to the left)
				highlight = 'gsh', -- Highlight surrounding
				replace = 'gsr', -- Replace surrounding
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
