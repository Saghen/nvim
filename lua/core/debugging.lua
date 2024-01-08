return {
	{
		'mfussenegger/nvim-dap',
		keys = {
			{ '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', desc = 'Toggle breakpoint' },
			{ '<leader>dc', '<cmd>lua require"dap".continue()<CR>', desc = 'Continue' },
			{ '<leader>dC', '<cmd>lua require"dap".run_to_cursor()<CR>', desc = 'Run to cursor' },
			{ '<leader>dd', '<cmd>lua require"dap".disconnect()<CR>', desc = 'Disconnect' },
			{ '<leader>di', '<cmd>lua require"dap.ui.variables".hover()<CR>', desc = 'Inspect' },
			{ '<leader>dn', '<cmd>lua require"dap".step_over()<CR>', desc = 'Step over' },
			{ '<leader>do', '<cmd>lua require"dap".step_out()<CR>', desc = 'Step out' },
			{ '<leader>ds', '<cmd>lua require"dap".step_into()<CR>', desc = 'Step into' },
		},
		config = function()
			vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError', linehl = '', numhl = '' })
			vim.fn.sign_define('DapStopped', { text = '▶️', texthl = 'DiagnosticInfo', linehl = '', numhl = '' })
		end,
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = { 'mfussenegger/nvim-dap' },
		config = function()
			local dap, dapui = require('dap'), require('dapui')
			dapui.setup()
			-- automatically open and close the dap ui when debugging
			dap.listeners.after.event_initialized['dapui_config'] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated['dapui_config'] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited['dapui_config'] = function()
				dapui.close()
			end
		end,
	},

	-- quick print statements
	{
		'andrewferrier/debugprint.nvim',
		version = '*',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
		opts = {},
	},
}
