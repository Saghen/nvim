return {
	-- snippets
	{
		'l3mon4d3/luasnip',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = 'v2.*',
		build = 'make install_jsregexp', -- optional
		keys = {
			{
				'<tab>',
				function()
					return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
				end,
				expr = true,
				silent = true,
				mode = 'i',
			},
			{
				'<tab>',
				function()
					require('luasnip').jump(1)
				end,
				mode = 's',
			},
			{
				'<s-tab>',
				function()
					require('luasnip').jump(-1)
				end,
				mode = { 'i', 's' },
			},
		},
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	},
	-- completion
	{
		'hrsh7th/nvim-cmp',
		version = false,
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'onsails/lspkind.nvim',
			'nvim-tree/nvim-web-devicons',
			'l3mon4d3/luasnip',
			'saadparwaiz1/cmp_luasnip',
		},
		opts = function()
			local cmp = require('cmp')
			return {
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = 'menu,menuone,preview',
				},
				mapping = cmp.mapping.preset.insert({
					['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-e>'] = cmp.mapping.abort(),

					['<CR>'] = cmp.config.disable,
					-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					['<Tab>'] = cmp.mapping.confirm({ select = true }),
					['<S-Tab>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					['<C-Space>'] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = 'cody' },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip', option = { show_autosnippets = true } },
					{ name = 'path' },
					{ name = 'buffer' },
				}),
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,

						-- copied from cmp-under
						function(entry1, entry2)
							local _, entry1_under = entry1.completion_item.label:find('^_+')
							local _, entry2_under = entry2.completion_item.label:find('^_+')
							entry1_under = entry1_under or 0
							entry2_under = entry2_under or 0
							if entry1_under > entry2_under then
								return false
							elseif entry1_under < entry2_under then
								return true
							end
						end,

						cmp.config.compare.kind,
					},
				},
				window = {
					completion = {
						col_offset = -3,
						side_padding = 0,
					},
				},
				formatting = {
					fields = { 'kind', 'abbr', 'menu' },
					format = function(entry, vim_item)
						local lspkind_opts = {
							mode = 'symbol_text',
							maxwidth = 50,
							symbol_map = require('utils.kinds'),
						}
						local new_entry = require('lspkind').cmp_format(lspkind_opts)(entry, vim_item)
						local strings = vim.split(new_entry.kind, '%s', { trimempty = true })

						new_entry.kind = ' ' .. (strings[1] or '') .. ' '
						new_entry.menu = '   ' .. (strings[2] or '')

						return new_entry
					end,
				},
			}
		end,
		config = function(_, opts)
			local cmp = require('cmp')
			cmp.setup(opts)

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = opts.mapping,
				sources = {
					{ name = 'buffer' },
				},
			})

			cmp.setup.cmdline(':', {
				mapping = opts.mapping,
				sources = cmp.config.sources({
					{ name = 'path' },
					{ name = 'cmdline' },
				}),
			})
		end,
	},
}
