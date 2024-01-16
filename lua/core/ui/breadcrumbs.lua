return {
	'utilyre/barbecue.nvim',
	name = 'barbecue',
	version = '*',
	event = 'BufRead',
	dependencies = {
		'SmiteshP/nvim-navic',
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		show_modified = true,
		symbols = {
			separator = '',
		},
		kinds = require('utils.kinds'),
		exclude_filetypes = { 'toggleterm' },
	},
}
