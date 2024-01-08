-- todo: should detect the schema automatically
return {
	'someone-stole-my-name/yaml-companion.nvim',
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope.nvim' },
	},
	keys = {
		{ '<leader>fy', '<cmd>lua require("telescope").extensions.yaml_schema.list{}<CR>', desc = 'YAML Schemas' },
	},
	config = function()
		require('telescope').load_extension('yaml_schema')
		require('yaml_companion').setup()
	end,
}
