return {
	{
		'saghen/blink.pick',
		dev = true,
		lazy = false,
		keys = {
			{
				'<leader>bp',
				function()
					require('blink_pick').open_window()
				end,
				desc = 'Pick',
			},
		},
		config = function()
			require('blink_pick')
		end,
	},

	{
		'saghen/blink.pairs',
		dev = true,
		opts = {},
	},

	{
		'saghen/blink.cmp',
		version = vim.fn.getenv('BLINK_VERSION') or false,
		dev = vim.fn.getenv('BLINK_VERSION') == vim.NIL,
		-- dependencies = { 'rafamadriz/friendly-snippets' },
		-- build = 'cargo build --release',
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				preset = 'none',

				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-e>'] = { 'cancel' },
				['<C-g>'] = { 'accept' },

				['<C-t>'] = { 'select_prev' },
				['<C-d>'] = { 'select_next' },
				['<C-p>'] = { 'select_prev' },
				['<C-n>'] = { 'select_next' },

				['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

				['<Tab>'] = { 'snippet_forward', 'fallback' },
				['<S-Tab>'] = { 'snippet_backward', 'fallback' },

				['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			},
			appearance = {
				nerd_font_variant = 'normal',
				use_nvim_cmp_as_default = true,
			},
			sources = { default = { 'lsp', 'buffer', 'path', 'snippets' } },
			fuzzy = { prebuilt_binaries = { ignore_version_mismatch = true } },

			snippets = { preset = 'luasnip' },

			signature = { enabled = true, window = { show_documentation = false } },
		},
		opts_extend = { 'sources.default' },
	},

	{
		'saghen/blink.nvim',
		dev = true,
		lazy = false,
		keys = {
			-- chartoggle
			{
				';',
				function()
					require('blink.chartoggle').toggle_char_eol(';')
				end,
				mode = 'v',
				desc = 'Toggle ; at eol',
			},
			{
				'<C-;>',
				function()
					require('blink.chartoggle').toggle_char_eol(';')
				end,
				mode = { 'i', 'n' },
				desc = 'Toggle ; at eol',
			},
			{
				',',
				function()
					require('blink.chartoggle').toggle_char_eol(',')
				end,
				mode = { 'n', 'v' },
				desc = 'Toggle , at eol',
			},
			{
				'<C-,>',
				function()
					require('blink.chartoggle').toggle_char_eol(',')
				end,
				mode = 'i',
				desc = 'Toggle , at eol',
			},

			-- select
			{
				'<leader>mb',
				function()
					require('blink.select').show('buffers')
				end,
				desc = 'Select buffer',
			},
			{
				'<leader>md',
				function()
					require('blink.select').show('diagnostics')
				end,
				desc = 'Select diagnostic',
			},
			{
				'<leader>mc',
				function()
					require('blink.select').show('recent-commands')
				end,
				desc = 'Select recent commands',
			},
			{
				'<leader>ms',
				function()
					require('blink.select').show('symbols')
				end,
				desc = 'Select symbol',
			},
			{
				'<leader>my',
				function()
					require('blink.select').show('yank-history')
				end,
				desc = 'Select yank history',
			},
			{
				'<leader>m/',
				function()
					require('blink.select').show('recent-searches')
				end,
				desc = 'Select search',
			},
			{
				'<leader>ma',
				function()
					require('blink.select').show('code-actions')
				end,
				desc = 'Select code action',
			},
			{
				'<leader>mo',
				function()
					require('blink.select').show('smart-open')
				end,
				desc = 'Select code action',
			},

			-- tree
			{ '<leader>E', '<cmd>BlinkTree reveal<cr>', desc = 'Reveal current file in tree' },
			{ '<leader>e', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree window or focus' },
		},
		opts = {
			chartoggle = { enabled = true },
			select = {
				enabled = true,
				mapping = {
					selection = { 'm', 'n', 'e', 'i', 'a', 'r', 's', 't' },
				},
			},
			indent = {
				enabled = true,
				scope = {
					highlights = {
						'RainbowOrange',
						'RainbowPurple',
						'RainbowBlue',
					},
					underline = {
						highlights = {
							'RainbowOrangeUnderline',
							'RainbowPurpleUnderline',
							'RainbowBlueUnderline',
						},
					},
				},
			},
			tree = { enabled = true },
		},
	},
}
