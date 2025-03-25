vim.api.nvim_create_autocmd('BufEnter', {
	pattern = 'COMMIT_EDITMSG',
	callback = function()
		vim.keymap.set('n', '<c-c><c-c>', '<cmd>wq<CR>', { noremap = true, buffer = true })
		vim.keymap.set('i', '<c-c><c-c>', '<esc><cmd>wq<CR>', { noremap = true, buffer = true })
	end,
})

return {
	-- { 'neovim/nvim-lspconfig', opts = { servers = { astro = {} } } },
	-- { 'tpope/vim-fugitive', enabled = os.getenv('NVIM_DEV') ~= nil },
	-- { 'milanglacier/yarepl.nvim', enabled = os.getenv('NVIM_DEV') ~= nil, opts = {} },
	{
		'neovim/nvim-lspconfig',
		opts = { servers = { ansiblels = {} } },
	},
}
