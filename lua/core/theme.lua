return {
	-- recolor devicons to match theme
	{
		'rachartier/tiny-devicons-auto-colors.nvim',
		event = 'UIEnter',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = true,
	},

	-- main theme
	{
		'navarasu/onedark.nvim',
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require('onedark').setup(opts)
			require('onedark').load()
		end,
		opts = function()
			return {
				transparent = false,
				colors = {
					black = vim.g.colors.crust,
					bg0 = vim.g.colors.base,
					bg1 = vim.g.colors.core,
					bg2 = vim.g.colors.surface_0,
					bg3 = vim.g.colors.surface_1,
					bg_d = vim.g.colors.mantle,
					grey = vim.g.surface_2,
					-- todo: is this one right?
					light_grey = vim.g.colors.overlay_2,

					-- todo: change these
					dark_bg_blue = '#16334B',
					dark_bg_green = '#2b3425',
					dark_bg_red = '#301c1e',
					dark_bg_yellow = '#685127',
					dark_bg_purple = '#42204C',

					-- blue = vim.g.colors.blue,
					-- cyan = vim.g.colors.cyan,
					-- green = vim.g.colors.green,
					-- orange = vim.g.colors.peach,
					-- purple = vim.g.colors.muave,
					-- red = vim.g.colors.red,
					-- yellow = vim.g.colors.yellow,
				},
				highlights = {
					Blue = { fg = '$blue' },
					Cyan = { fg = '$cyan' },
					Green = { fg = '$green' },
					Orange = { fg = '$orange' },
					Purple = { fg = '$purple' },
					Red = { fg = '$red' },
					Yellow = { fg = '$yellow' },

					Primary = { fg = '$blue' },
					-- fixme: breaks copilot and lines with LSP hints
					-- Comment = { fg = '$blue' },
					['@comment'] = { fg = '$blue' },
					['@lsp.type.comment'] = { fg = '$blue' },

					['@operator'] = { fg = '$cyan' },
					['@lsp.type.variable'] = { fg = '$yellow' },
					['@lsp.type.property'] = { fg = '$red' },
					['@lsp.type.generic'] = { fg = '$red' },

					NormalFloat = { bg = '$bg_d' },
					PMenuSel = { bg = '$blue', fg = '$bg1' },
					WinSeparator = { fg = '$bg2', bg = '$bg_d' },
					WinBar = { bg = '$bg0' },
					WinBarNC = { bg = '$bg0' },
					StatusLine = { bg = '$bg0', fg = '$bg0' },
					StatusLineNC = { bg = '$bg0', fg = '$bg0' },

					BufferCurrentMod = { fg = '$yellow', fmt = 'bold' },

					RainbowOrange = { fg = '$orange' },
					RainbowPurple = { fg = '$purple' },
					RainbowBlue = { fg = '$blue' },
					RainbowOrangeUnderline = { sp = '$orange', fmt = 'underline' },
					RainbowPurpleUnderline = { sp = '$purple', fmt = 'underline' },
					RainbowBlueUnderline = { sp = '$blue', fmt = 'underline' },

					DashboardHeader = { fg = '$blue' },

					InclineNormal = { bg = '$bg1' },
					InclineNormalNC = { bg = '$bg1' },

					EdgyNormal = { bg = '$bg_d' },

					BlinkTreeNormal = { bg = '$bg_d' },
					BlinkTreeNormalNC = { bg = '$bg_d' },
					BlinkTreeIndent = { fg = '$bg3' },
					BlinkTreeModified = { fg = '$yellow' },
					BlinkTreeGitStaged = { fg = '$green' },
					BlinkTreeGitModified = { fg = '$yellow' },
					BlinkTreeGitAdded = { fg = '$blue' },
					BlinkTreeGitConflict = { fg = '$red' },
					BlinkTreeGitUntracked = { fg = '$red' },
					BlinkTreeFlagCut = { fg = '$green', fmt = 'italic' },
					BlinkTreeFlagCopy = { fg = '$blue', fmt = 'italic' },

					BlinkIndent = { fg = '$bg2' },

					ModeNormal = { fg = '$green' },
					ModeInsert = { fg = '$blue' },
					ModeVisual = { fg = '$yellow' },
					ModeCommand = { fg = '$red' },
					ModeSelect = { fg = '$purple' },
					ModeReplace = { fg = '$red' },

					TelescopePathSeparator = { fg = '$light_grey' },

					MiniClueBorder = { fg = '$bg_d', bg = '$bg_d' },
					MiniClueSeparator = { fg = '$bg2' },
					MiniClueTitle = { fg = '$blue', bg = '$bg_d' },
					MiniClueDescGroup = { fg = '$grey', bg = '$bg_d' },
					MiniClueDescSingle = { bg = '$bg_d' },

					TelescopePreviewBorder = { fg = '$grey' },
					TelescopePromptBorder = { fg = '$grey' },
					TelescopeResultsBorder = { fg = '$grey' },

					TelescopePreviewTitle = { fg = '$blue' },
					TelescopePromptTitle = { fg = '$blue' },
					TelescopeResultsTitle = { fg = '$blue' },
				},
			}
		end,
	},
}
