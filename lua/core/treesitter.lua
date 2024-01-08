return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		dependencies = {
			-- 'nvim-treesitter/nvim-treesitter-textobjects',
		},
		keys = {
			-- { '<C-Space>', desc = 'Increment selection', mode = { 'n', 'v' } },
			{ '<bs>', desc = 'Decrement selection', mode = 'x' },
		},
		---@type TSConfig
		---@diagnostic disable-next-line: missing-fields
		opts = {
			auto_install = true,
			-- todo: slow on typescript files?
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			ensure_installed = {
				'bash',
				'c',
				'c_sharp',
				'cpp',
				'csv',
				'diff',
				'go',
				'gomod',
				'gosum',
				'json',
				'json5',
				'jsonc',
				'lua',
				'luadoc',
				'luap',
				'markdown',
				'markdown_inline',
				'nix',
				'php',
				'python',
				'query',
				'regex',
				'rust',
				'scala',
				'scss',
				'toml',
				'tsv',
				'vim',
				'vimdoc',
				'yaml',
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					-- init_selection = '<C-space>',
					-- node_incremental = '<C-space>',
					scope_incremental = false,
					node_decremental = '<bs>',
				},
			},
			textobjects = {
				move = {
					enable = true,
					goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer' },
					goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer' },
					goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer' },
					goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer' },
				},
			},
		},
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
		end,
	},

	-- detect language using treesitter
	-- todo: havent used this much so far afaik
	{
		'spywhere/detect-language.nvim',
		opts = {
			languages = {
				'typescript',
				'typescriptreact',
				'javascript',
				'javascriptreact',
				'yaml',
				'json',
				'html',
				'toml',
				'csv',
				'bash',
				'c_sharp',
				'cpp',
				'c',
				'go',
				'graphql',
				'java',
				'json5',
				'jsonc',
				'lua',
				'php',
				'python',
				'rust',
				'scala',
				'scss',
				'vim',
			},
			-- autocmd events to trigger auto-detection
			events = { 'InsertLeave', 'TextChanged', 'FileReadPost' },
			-- command configurations
			commands = {
				-- Prefix for command (set to empty will disable all commands)
				prefix = 'DetectLanguage',
				-- Enable buffer toggle command (suffixed with 'BufToggle')
				toggle = true,
				-- Enable buffer enable command (suffixed with 'BufEnable')
				enable = true,
				-- Enable buffer disable command (suffixed with 'BufDisable')
				disable = true,
				-- Enable manual trigger for auto-detection command (no suffix)
				oneshot = true,
				-- Enable command for listing language scores (suffixed with 'BufScore')
				score_list = false,
			},
			-- disable auto-detection for buffer over this number of lines (set to 0 for no limit)
			max_lines = 5000,
			-- fine-grain setup
			disable = {
				-- disable auto-detection on new buffer
				new = false,
				-- disable auto-detection on buffer with no extension
				no_extension = true,
			},
		},
	},
}
