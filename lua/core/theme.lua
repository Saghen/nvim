return {
	'navarasu/onedark.nvim',
	name = 'onedark',
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		require('onedark').setup(opts)
		require('onedark').load()
	end,
	opts = {
		transparent = false,
		colors = {
			black = '#131019',
			bg0 = '#1E1E28',
			bg1 = '#2d2939',
			bg2 = '#332E41',
			bg3 = '#393348',
			bg_d = '#1c1a24',
			grey = '#57566f',
			dark_bg_blue = '#202d37',
			dark_bg_green = '#2b3425',
			dark_bg_red = '#301c1e',
		},
		highlights = {
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
			WinSeparator = { fg = '$bg2' },

			RainbowOrange = { fg = '$orange' },
			RainbowPurple = { fg = '$purple' },
			RainbowBlue = { fg = '$blue' },

			DashboardHeader = { fg = '$blue' },

			EdgyNormal = { bg = '$bg_d' },
			EdgyIcon = { bg = '$dark_bg_blue', fg = '$blue' },
			EdgyIconActive = { bg = '$dark_bg_blue', fg = '$blue' },
			EdgyTitle = { bg = '$dark_bg_blue', fg = '$blue' },
			EdgyWinBar = { bg = '$dark_bg_blue' },

			NeoTreeMessage = { fg = '$light_grey' },
			NeoTreeRootName = { fg = '$light_grey' },
			NeoTreeTabInactive = { bg = '$bg_d' },
			NeoTreeTabActive = { bg = '$bg1' },
			NeoTreeWinSeparator = { fg = '$bg2', bg = '$bg_d' },

			AerialLine = { bg = 'bg_d', fg = '$blue' },
			AerialWinSeparator = { fg = '$bg2', bg = '$bg_d' },

			TelescopePathSeparator = { fg = '$light_grey' },

			GitBlameVirtText = { fg = '$grey' },

			--- CMP
			CmpItemMenu = { fg = '$light_grey' },
			-- abbreviations
			CmpItemAbbr = { bg = 'NONE', fg = '$light_grey' },
			CmpItemAbbrDeprecated = { bg = 'NONE', strikethrough = true, fg = '$grey' },
			CmpItemAbbrMatch = { bg = 'NONE', fg = '$fg', underline = false },
			CmpItemAbbrMatchFuzzy = { link = 'CmpIntemAbbrMatch' },
			-- kinds
			CmpItemKindVariable = { bg = '$red', fg = '$fg' },
			CmpItemKindText = { link = 'CmpItemKindVariable' },
			CmpItemKindField = { link = 'CmpItemKindVariable' },
			--
			CmpItemKindConstant = { bg = '$yellow', fg = '$black' },
			CmpItemKindClass = { link = 'CmpItemKindConstant' },
			CmpItemKindInterface = { link = 'CmpItemKindClass' },
			CmpItemKindModule = { link = 'CmpItemKindClass' },
			CmpItemKindConstructor = { link = 'CmpItemKindClass' },
			--
			CmpItemKindFunction = { bg = '$blue', fg = 'white' },
			CmpItemKindMethod = { link = 'CmpItemKindFunction' },
			--
			CmpItemKindKeyword = { bg = '$grey', fg = 'white' },
			CmpItemKindProperty = { link = 'CmpItemKindKeyword' },
			CmpItemKindUnit = { link = 'CmpItemKindKeyword' },

			-- uncomment to use background instead of underline
			-- IlluminatedWordText = { bg = '$bg1' },
			-- IlluminatedWordRead = { bg = '$bg1' },
			-- IlluminatedWordWrite = { bg = '$bg1' },
		},
	},
}
