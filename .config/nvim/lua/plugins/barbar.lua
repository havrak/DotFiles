local M = {"romgrk/barbar.nvim", event = "VeryLazy"}
function M.config()
	require'bufferline'.setup {
		animation = false,
		maximum_padding = 0,
		minimum_padding = 0,
		icons = {button = ' ', modified = {button = ' ●'}, separator = {left = '▊'}},
	}

	-- Moving between
	vim.keymap.set("n", "<M-S-,>", "<Cmd>BufferMovePrevious<CR>")
	vim.keymap.set("n", "<M-S-.>", "<Cmd>BufferMoveNext<CR>")
	vim.keymap.set("", ",", "<Cmd>BufferPrevious<CR>")
	vim.keymap.set("i", "<M-,>", "<Esc><Cmd>BufferPrevious<CR>a")
	vim.keymap.set("t", "<M-,>", "<C-\\><C-n><Cmd>BufferPrevious<CR>a")
	vim.keymap.set("", ".", "<Cmd>BufferNext<CR>")
	vim.keymap.set("i", "<M-.>", "<Esc><Cmd>BufferNext<CR>a")
	vim.keymap.set("t", "<M-.>", "<C-\\><C-n><Cmd>BufferNext<CR>a")
	vim.keymap.set("", "<S-Tab>", "<Cmd>BufferPrevious<CR>")
	vim.keymap.set("", "<Tab>", "<Cmd>BufferNext<CR>")
	-- Direct selection
	vim.keymap.set({"", "i"}, "<Leader>1", "<Cmd>BufferGoto 1<CR>")
	vim.keymap.set({"", "i"}, "<Leader>2", "<Cmd>BufferGoto 2<CR>")
	vim.keymap.set({"", "i"}, "<Leader>3", "<Cmd>BufferGoto 3<CR>")
	vim.keymap.set({"", "i"}, "<Leader>4", "<Cmd>BufferGoto 4<CR>")
	vim.keymap.set({"", "i"}, "<Leader>5", "<Cmd>BufferGoto 5<CR>")
	vim.keymap.set({"", "i"}, "<Leader>6", "<Cmd>BufferGoto 6<CR>")
	vim.keymap.set({"", "i"}, "<Leader>7", "<Cmd>BufferGoto 7<CR>")
	vim.keymap.set({"", "i"}, "<Leader>8", "<Cmd>BufferGoto 8<CR>")
	vim.keymap.set({"", "i"}, "<Leader>9", "<Cmd>BufferGoto 9<CR>")
	-- Closing
	vim.keymap.set({"", "i"}, "<C-w>", "<Cmd>BufferClose<CR>")
	vim.keymap.set({"", "i"}, "<C-S-W>", "<Cmd>BufferClose!<CR>")
	vim.keymap.set("t", "<C-S-D>", "<C-d><Cmd>BufferClose!<CR>a")
end
return M
