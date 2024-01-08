return {
	-- snippets
	{
		'l3mon4d3/luasnip',
		-- follow latest release.
		version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = 'make install_jsregexp',
	},
	-- completion
	{
		'hrsh7th/nvim-cmp',
		-- commit = 'abb5c7519d40314240effc70d781149c0f097af3',
		version = false,
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'onsails/lspkind.nvim',
			'nvim-tree/nvim-web-devicons',
			'l3mon4d3/luasnip',
		},
		opts = function()
			local cmp = require('cmp')
			return {
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				performance = {
					debounce = 0,
				},
				completion = {
					completeopt = 'menu,menuone,noinsert',
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
					{ name = 'nvim_lsp', priority = 10 },
					{ name = 'luasnip', priority = 9 },
					{ name = 'path', priority = 2 },
					{ name = 'buffer', priority = 1 },
				}),
				sorting = {
					priority_weight = 1.0,
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,

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
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
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
