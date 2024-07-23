-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local function map(key, command, opts)
			local mode = opts.mode or 'n'
			opts.mode = nil
			opts.buffer = ev.buf
			vim.keymap.set(mode, key, command, opts)
		end

		map('<leader>cL', '<cmd>LspInfo<cr>', { desc = 'Lsp Info' })
		map('gd', function()
			require('telescope.builtin').lsp_definitions({ reuse_win = true })
		end, { desc = 'Goto Definition' })
		map('gr', '<cmd>Telescope lsp_references<cr>', { desc = 'References' })
		map('gD', vim.lsp.buf.declaration, { desc = 'Goto Declaration' })
		map('gI', function()
			require('telescope.builtin').lsp_implementations({ reuse_win = true })
		end, { desc = 'Goto Implementation' })
		map('gy', function()
			require('telescope.builtin').lsp_type_definitions({ reuse_win = true })
		end, { desc = 'Goto Type Definition' })
		map('K', vim.lsp.buf.hover, { desc = 'Hover' })
		map('gK', vim.lsp.buf.signature_help, { desc = 'Signature Help' })
		map('<c-k>', vim.lsp.buf.signature_help, { mode = 'i', desc = 'Signature Help' })
		map('<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action', mode = { 'n', 'v' } })
		map('<leader>cA', function()
			vim.lsp.buf.code_action({
				context = {
					only = {
						'source',
					},
					diagnostics = {},
				},
			})
		end, { desc = 'Source Action' })
	end,
})

-- Format on save
vim.api.nvim_create_autocmd('BufWritePre', {
	desc = 'Format on save',
	pattern = '*',
	callback = function(args)
		if not vim.api.nvim_buf_is_valid(args.buf) or vim.bo[args.buf].buftype ~= '' then
			return
		end
		if vim.g.disable_autoformat then
			return
		end
		vim.lsp.buf.format({
			filter = function(client)
				return client.name == 'efm'
			end,
		})
	end,
})

return {
	{
		priority = 1000,
		'neovim/nvim-lspconfig',
		dependencies = { 'creativenull/efmls-configs-nvim' },
		keys = {
			{
				'<leader>cf',
				function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == 'efm'
						end,
					})
				end,
				desc = 'Format',
				mode = { 'n', 'v' },
			},
			{
				'<leader>uf',
				function()
					if vim.g.disable_autoformat == nil then
						vim.g.disable_autoformat = true
					else
						vim.g.disable_autoformat = not vim.g.disable_autoformat
					end
				end,
				desc = 'Toggle format on save',
			},
		},
		opts = {
			servers = {
				dockerls = {},
				efm = {
					filetypes = {},
					settings = {
						version = 2,
						rootMarkers = { '.git/' },
						languages = {},
					},
					init_options = {
						documentFormatting = true,
						documentRangeFormatting = true,
					},
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			for server, config in pairs(opts.servers) do
				lspconfig[server].setup(config)
			end
		end,
	},
	{ 'nvimtools/none-ls.nvim', dependencies = 'nvim-lua/plenary.nvim' },

	-- emulates the LSP definition and references when unsupported
	{
		'pechorin/any-jump.vim',
		keys = {
			{ '<leader>j', '<cmd>AnyJump<cr>', desc = 'Grep References' },
		},
		init = function()
			vim.g.any_jump_disable_default_keybindings = 1
		end,
		-- config = function() end,
	},
}
