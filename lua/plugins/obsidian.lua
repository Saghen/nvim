-- todo: currently unused because plugin integration and styling
return {
	{
		'lukas-reineke/headlines.nvim',
		dependencies = 'nvim-treesitter/nvim-treesitter',
		opts = {
			markdown = {
				headline_highlights = { 'Headline1', 'Headline2', 'Headline3' },
			},
		},
	},
	{
		'epwalsh/obsidian.nvim',
		enabled = false,
		version = '*',
		ft = 'markdown',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{ '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'New note' },
			{ '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = 'Open note' },
			{ '<leader>ot', '<cmd>ObsidianToggle<cr>', desc = 'Toggle note' },
			{ '<leader>os', '<cmd>ObsidianSearch<cr>', desc = 'Search notes' },
			{ '<leader>ok', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Quick switch' },
			{ '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'View backlinks' },
			{ '<leader>oT', '<cmd>ObsidianTemplate<cr>', desc = 'Insert a template' },
			{ '<leader>ol', '<cmd>ObsidianLink<cr>', desc = 'Insert a link' },
			{ '<leader>oL', '<cmd>ObsidianLinkNew<cr>', desc = 'Insert a link to new note' },
			{ '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Paste image' },
			{ '<leader>or', '<cmd>ObsidianRename<cr>', desc = 'Rename note' },
		},
		opts = {
			disable_frontmatter = true,
			workspaces = {
				{
					name = 'notes',
					path = '~/notes',
				},
			},
			ui = {
				checkboxes = {
					[' '] = { char = '󱓼', hl_group = 'ObsidianTodo' },
					['/'] = { char = '󰿦', hl_group = 'ObsidianInProgress' },
					['x'] = { char = '󰄲', hl_group = 'ObsidianDone' },
					['~'] = { char = '󰛲', hl_group = 'ObsidianCancelled' },
				},
				external_link_icon = { char = '󰌹', hl_group = 'ObsidianExtLinkIcon' },
				hl_groups = {
					-- defined in theme config
				},
			},
		},
	},
}
