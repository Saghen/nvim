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
			highlight = {
				enable = true,
				disable = { 'nix', 'python', 'go', 'lua' },
			},
			indent = { enable = false },
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
}
