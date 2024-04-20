return {
	-- todo: rework bindings and use
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
				'c',
				'c_sharp',
				'cpp',
				'diff',
				'graphql',
				'haskell',
				'nix',
				'php',
				'python',
				'query',
				'regex',
				'rust',
				'scala',
				'vim',
				'vimdoc',
				-- shells
				'bash',
				'fish',
				-- config langs
				'json',
				'json5',
				'jsonc',
				'yaml',
				'toml',
				'ini',
				'csv',
				'tsv',
				-- doc langs
				'latex',
				'bibtex',
				'rst',
				'markdown',
				'markdown_inline',
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					node_incremental = 'v',
					node_decremental = 'V',
				},
			},
			textobjects = {
				move = {
					enable = false,
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
		enabled = false,
		'spywhere/detect-language.nvim',
		opts = {
			languages = {
				'yaml',
				'json',
				'html',
				'toml',
				'csv',
				'bash',
				'java',
				'json5',
				'jsonc',
				'markdown',
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
