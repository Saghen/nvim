return {
	{
		'cljoly/telescope-repo.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
		},
		keys = {
			{ '<leader>fg', "<cmd>lua require'telescope'.extensions.repo.list{}<cr>", desc = 'Git Repositories' },
		},
		config = function()
			require('telescope').load_extension('repo')
		end,
	},
	{
		'gnikdroy/projections.nvim',
		branch = 'pre_release',
		keys = {
			{ '<leader>fp', "<cmd>lua require('telescope').extensions.projections.projections({})<cr>", desc = 'Projects' },
		},
		opts = {
			workspaces = {
				'~/code/personal',
				'~/code/neovim',
				'~/code/liqwid',
				'~/code/superfishial/',
				'~/code/oz/',
			},
			store_hooks = {
				pre = function()
					-- close neo-tree
					if pcall(require, 'neo-tree') then
						vim.cmd([[Neotree action=close]])
					end

					-- close all terminals
					for _, winid in ipairs(vim.api.nvim_list_wins()) do
						local bufnr = vim.api.nvim_win_get_buf(winid)
						if vim.fn.getbufvar(bufnr, '&buftype') == 'terminal' then
							vim.api.nvim_win_close(winid, true)
						end
					end

					-- close assorted buffers
					local buffer_filetypes = { 'qf', 'help', 'spectre_panel', 'toggleterm', 'OverseerList' }
					for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
						local filetype = vim.fn.getbufvar(bufnr, '&filetype')
						if vim.tbl_contains(buffer_filetypes, filetype) then
							vim.api.nvim_buf_delete(bufnr, { force = true })
						end
					end
				end,
			},
			restore_hooks = {
				post = function()
					vim.cmd([[Neotree]])
					vim.cmd([[wincmd p]])
				end,
			},
		},
		config = function(_, opts)
			require('projections').setup(opts)

			-- Autostore session on VimExit
			local Session = require('projections.session')
			vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
				callback = function()
					Session.store(vim.loop.cwd())
				end,
			})

			-- Switch to project if vim was started in a project dir or if the dir is changed
			local switcher = require('projections.switcher')
			vim.api.nvim_create_autocmd({ 'VimEnter' }, {
				callback = function()
					if vim.fn.argc() == 0 then
						switcher.switch(vim.loop.cwd())
					end
				end,
			})
		end,
	},
}
