vim.api.nvim_exec([[
  augroup disable_auto_comment
    autocmd!
    autocmd BufEnter * set fo-=c fo-=r fo-=o
  augroup END
]], false)



vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function() require'vim.highlight'.on_yank {higroup = "Search", timeout = 50} end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	group = group,
	command = "normal! zz",
})

