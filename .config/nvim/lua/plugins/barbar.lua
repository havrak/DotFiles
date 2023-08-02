local M = {"romgrk/barbar.nvim", lazy = false}
function M.config()
	require'bufferline'.setup {
		animation = false,
		maximum_padding = 0,
		minimum_padding = 0,
		icons = {button = ' ', modified = {button = ' ●'}, separator = {left = '▊'}},
	}

	-- Moving between
	vim.keymap.set("n", "mt", "<Cmd>BufferMovePrevious<CR>")
	vim.keymap.set("n", "mT", "<Cmd>BufferMoveNext<CR>")
	-- Direct selection
	vim.keymap.set("n", "<Leader>1", "<Cmd>BufferGoto 1<CR>")
	vim.keymap.set("n", "<Leader>2", "<Cmd>BufferGoto 2<CR>")
	vim.keymap.set("n", "<Leader>3", "<Cmd>BufferGoto 3<CR>")
	vim.keymap.set("n", "<Leader>4", "<Cmd>BufferGoto 4<CR>")
	vim.keymap.set("n", "<Leader>5", "<Cmd>BufferGoto 5<CR>")
	vim.keymap.set("n", "<Leader>6", "<Cmd>BufferGoto 6<CR>")
	vim.keymap.set("n", "<Leader>7", "<Cmd>BufferGoto 7<CR>")
	vim.keymap.set("n", "<Leader>8", "<Cmd>BufferGoto 8<CR>")
	vim.keymap.set("n", "<Leader>9", "<Cmd>BufferGoto 9<CR>")
	-- Closing
	vim.keymap.set("n", "Q", "<Cmd>BufferClose<CR>")
end
return M
