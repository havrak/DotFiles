vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = "*",
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = "mail",
	command = "setlocal textwidth=0",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	command = "%s/\\s\\+$//e",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function() require'vim.highlight'.on_yank {higroup = "Search", timeout = 50} end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	group = group,
	command = "normal! zz",
})

vim.api.nvim_create_autocmd("VimLeave", {
	group = group,
	pattern = "tex",
	command =  "!texclear %"
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = group,
	pattern = "wiki",
	command =  "Vimwiki2HTML",
})

vim.api.nvim_create_autocmd("Filetype", {
	group = group,
	pattern = "vimwiki",
	command =  "let g:copilot_enabled = v:false",
})
