local map = require('tuque.utils').map

-- never use the cmdline window, so remap q: to :q
-- which is what i usually meant
-- TODO: causes a delay on `q` in trouble window
-- map('n', 'q:', ':q<cr>', { desc = 'Quit' })

map('n', '-', '``', { desc = 'Jump to last edit location' })
map('n', "'", '`') -- To make room for ` as terminal key

map('n', 'C', 'ciw', { desc = 'Change inside word' })

-- better up/down - allows moving to wrapped lines
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- better ^/$ via gh/gl/gs
map({ 'v', 'n' }, 'gl', '$', { noremap = true, silent = true })
map({ 'v', 'n' }, 'gh', '0', { noremap = true, silent = true })
map({ 'v', 'n' }, 'gs', '^', { noremap = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map({ 'n', 't' }, '<C-h>', function()
	vim.cmd.wincmd('h')
end, { desc = 'Go to left window' })
map({ 'n', 't' }, '<C-j>', function()
	vim.cmd.wincmd('j')
end, { desc = 'Go to lower window' })
map({ 'n', 't' }, '<C-k>', function()
	vim.cmd.wincmd('k')
end, { desc = 'Go to upper window' })
map({ 'n' }, '<C-l>', function() -- TODO: not used for terminal because we want clear
	vim.cmd.wincmd('l')
end, { desc = 'Go to right window' })
map({ 'n', 't' }, '<S-Left>', function()
	vim.cmd.wincmd('h')
end, { desc = 'Go to left window', remap = true })
map({ 'n', 't' }, '<S-Down>', function()
	vim.cmd.wincmd('j')
end, { desc = 'Go to lower window', remap = true })
map({ 'n', 't' }, '<S-Up>', function()
	vim.cmd.wincmd('k')
end, { desc = 'Go to upper window', remap = true })
map({ 'n', 't' }, '<S-Right>', function()
	vim.cmd.wincmd('l')
end, { desc = 'Go to right window', remap = true })

-- buffers
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })

local function switch_to_nth_previous_buffer(n)
	return function()
		local prev_buf = require('tuque.buffer-history').get_nth_previous_buffer(n)
		if prev_buf ~= nil then
			vim.api.nvim_win_set_buf(0, prev_buf)
		else
			vim.notify('No previous buffer found')
		end
	end
end
map('n', '<leader>bb', switch_to_nth_previous_buffer(1), { desc = 'Other buffer' })
map('n', '<backspace>', switch_to_nth_previous_buffer(1), { desc = 'Other buffer' })
map('n', '<S-backspace>', switch_to_nth_previous_buffer(2), { desc = 'Other buffer' })

-- jump to next/prev file
map('n', '[f', function()
	local current_file = vim.fn.expand('%:p')

	-- get all files in the directory, sorted
	local files = vim.fn.glob(vim.fn.expand('%:p:h') .. '/*', false, true)
	files = vim.tbl_filter(function(file)
		return vim.fn.isdirectory(file) == 0
	end, files)
	table.sort(files)

	local index = vim.fn.index(files, current_file) + 1
	if index <= 1 then
		return
	end
	vim.cmd('e ' .. files[index - 1])
end, { desc = 'Prev file' })
map('n', ']f', function()
	local current_file = vim.fn.expand('%:p')

	-- get all files in the directory, sorted
	local files = vim.fn.glob(vim.fn.expand('%:p:h') .. '/*', false, true)
	files = vim.tbl_filter(function(file)
		return vim.fn.isdirectory(file) == 0
	end, files)
	table.sort(files)

	local index = vim.fn.index(files, current_file) + 1
	if index == #files or index == 0 then
		return
	end
	vim.cmd('e ' .. files[index + 1])
end, { desc = 'Next file' })

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next search result' })
map({ 'x', 'o' }, 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev search result' })
map({ 'x', 'o' }, 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- quit
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })
map('n', '<leader>qQ', '<cmd>qa!<cr>', { desc = 'Force quit all' })

-- ctrl based commands
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
-- map({ 'i', 'x', 'n', 's' }, '<C-S>', '<cmd>SudoWrite<cr><esc>', { desc = 'Save file with sudo' })
map({ 'i', 'n' }, '<C-a>', 'ggVG', { desc = 'Select all' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- options
map('n', '<leader>uw', '<cmd>set wrap!<cr>', { desc = 'Toggle line wrapping' })
map('n', '<leader>uc', function()
	local value = vim.opt.conceallevel
	vim.opt.conceallevel = value == 0 and 2 or 0
end, { desc = 'Toggle conceal' })

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- windows
map('n', '<leader>ww', '<C-W>p', { desc = 'Other window', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete window', remap = true })
map('n', '<leader>wh', '<C-W>s', { desc = 'Split window below', remap = true })
map('n', '<leader>wv', '<C-W>v', { desc = 'Split window right', remap = true })

-- debugging
map('n', '<leader>dps', function()
	require('plenary.profile').start('profile.log', { flame = true })
end, { desc = 'Start Lua profiling' })
map('n', '<leader>dpS', function()
	require('plenary.profile').stop()
end, { desc = 'Stop Lua profiling' })

-- clipboard
map('v', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
map('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
map('v', '<leader>P', '"+P', { desc = 'Paste from clipboard' })
map('n', '<leader>P', '"+P', { desc = 'Paste from clipboard' })
map('v', '<leader>y', '"+y', { desc = 'Yank to clipboard' })
map('v', '<leader>Y', function()
	local curl = require('plenary.curl')
	local strings = require('plenary.strings')
	local filetype_to_extensions = {
		lua = 'lua',
		typescript = 'ts',
		javascript = 'js',
		typescriptreact = 'tsx',
		javascriptreact = 'jsx',
		markdown = 'md',
		json = 'json',
		yaml = 'yaml',
		toml = 'toml',
		html = 'html',
		css = 'css',
		scss = 'scss',
		sass = 'sass',
		less = 'less',
		graphql = 'graphql',
		sql = 'sql',
		vim = 'vim',
		sh = 'sh',
		fish = 'fish',
		zsh = 'zsh',
		bash = 'bash',
		python = 'py',
		rust = 'rs',
		go = 'go',
		java = 'java',
		c = 'c',
		cpp = 'cpp',
		tsx = 'tsx',
		jsx = 'jsx',
		php = 'php',
		ruby = 'rb',
		r = 'r',
		ocaml = 'ml',
		haskell = 'hs',
		scala = 'scala',
		clojure = 'clj',
		elixir = 'ex',
		erlang = 'erl',
		dart = 'dart',
		nim = 'nim',
		purescript = 'purs',
		reason = 're',
		svelte = 'svelte',
		vue = 'vue',
		crystal = 'cr',
		zig = 'zig',
		julia = 'jl',
		racket = 'rkt',
		scheme = 'scm',
		lisp = 'lisp',
		fennel = 'fnl',
		moonscript = 'moon',
		nix = 'nix',
	}

	vim.cmd.normal({ '"zy', bang = true })
	local selected_text = strings.dedent(vim.fn.getreg('z'))

	local response = curl.post('https://paste.super.fish/', {
		method = 'POST',
		body = selected_text,
	})

	local redirect_url = response.body
	local extension = filetype_to_extensions[vim.bo.filetype] or 'txt'
	if redirect_url then
		vim.fn.setreg('+', 'https://paste.super.fish' .. redirect_url .. '.' .. extension)
		vim.notify('Copied to clipboard and system clipboard')
	else
		vim.notify('Failed to upload to pastebin')
	end
end, { desc = 'Upload selection to paste bin' })
