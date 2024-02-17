return {
	enabled = false,
	'akinsho/bufferline.nvim',
	version = '*',
	lazy = false,
	keys = {
		{ '<C-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', desc = 'Go to buffer 1' },
		{ '<C-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', desc = 'Go to buffer 2' },
		{ '<C-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', desc = 'Go to buffer 3' },
		{ '<C-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', desc = 'Go to buffer 4' },
		{ '<C-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', desc = 'Go to buffer 5' },
		{ '<C-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', desc = 'Go to buffer 6' },
		{ '<C-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', desc = 'Go to buffer 7' },
		{ '<C-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', desc = 'Go to buffer 8' },
		{ '<C-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', desc = 'Go to buffer 9' },
		{ '<S-l>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
		{ '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
		{ '<A-S-l>', '<Cmd>BufferLineMoveNext<CR>', desc = 'Move buffer right' },
		{ '<A-S-h>', '<Cmd>BufferLineMovePrev<CR>', desc = 'Move buffer left' },
	},
	opts = {
		highlights = {
			fill = {
				bg = { attribute = 'bg', highlight = 'NeoTreeNormal' },
			},
			background = {
				bg = { attribute = 'bg', highlight = 'NeoTreeNormal' },
			},
			tab_separator_selected = {
				fg = { attribute = 'fg', highlight = 'Primary' },
				sp = { attribute = 'fg', highlight = 'Primary' },
			},
			buffer_selected = {
				fg = { attribute = 'fg', highlight = 'Primary' },
				sp = { attribute = 'fg', highlight = 'Primary' },
			},
			indicator_selected = {
				sp = { attribute = 'fg', highlight = 'Primary' },
			},
			hint_selected = {
				sp = { attribute = 'fg', highlight = 'Primary' },
			},
			duplicate_selected = {
				sp = { attribute = 'fg', highlight = 'Primary' },
			},
			close_button_selected = {
				fg = { attribute = 'fg', highlight = 'Primary' },
				sp = { attribute = 'fg', highlight = 'Primary' },
			},
			modified_selected = {
				fg = { attribute = 'fg', highlight = 'Primary' },
				sp = { attribute = 'fg', highlight = 'Primary' },
			},
			offset_separator = {
				fg = { attribute = 'fg', highlight = 'NeoTreeWinSeparator' },
				bg = { attribute = 'bg', highlight = 'NeoTreeWinSeparator' },
			},
		},
		options = {
			close_command = function(n)
				require('mini.bufremove').delete(n, false)
			end,
			diagnostics = false, -- | "nvim_lsp" | "coc",
			separator_style = { '', '' }, -- | "thick" | "thin" | { 'any', 'any' },
			indicator = {
				style = 'underline',
			},
			offsets = {
				{
					filetype = 'neo-tree',
					text = 'EXPLORER',
					text_align = 'center',
					-- todo: doesnt use the same style with onedark
					separator = true,
				},
			},
			hover = {
				enabled = true,
				delay = 0,
				reveal = { 'close' },
			},
		},
	},
}
