local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- dependencies = "windwp/nvim-ts-autotag",
	event = "VeryLazy",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"bibtex",
			"c",
			"cpp",
			"css",
			"gitcommit",
			"html",
			"java",
			"json",
			"javascript",
			"latex",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"rust",
			"vim",
			"yaml",
		},
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
		},
		autotag = { enable = true },
		rainbow = { enable = true },
		refactor = {
			highlight_definitions = {
				enable = true,
			},
		},
	})
	vim.cmd("hi WARN	term=bold guibg=#B71C1C guifg=white		ctermbg=red ctermfg=white")
	vim.cmd("hi TODO	term=bold guibg=#283593 guifg=white  ctermbg=blue	ctermfg=white")
	vim.cmd("hi INFO	term=bold	guibg=#33691E guifg=white ctermbg=green ctermfg=white")
	vim.cmd("hi COOL	term=bold guibg=#2196F3 guifg=white  ctermbg=blue	ctermfg=white")
	vim.cmd("hi FAV		term=bold	guibg=#EC407A guifg=white ctermbg=red ctermfg=white")

	function setup_highlights()
		vim.fn.matchadd("TODO", "TODO")
		vim.fn.matchadd("WARN", "DELETE")
		vim.fn.matchadd("WARN", "WARN")
		vim.fn.matchadd("INFO", "INFO")
		vim.fn.matchadd("INFO", "OPTIONAL")
		vim.fn.matchadd("INFO", "DONE")
		vim.fn.matchadd("COOL", "COOL")
		vim.fn.matchadd("FAV", "FAV")
	end

	setup_highlights()

	local highlight_group = vim.api.nvim_create_augroup("Highlights", {})

	vim.api.nvim_create_autocmd("WinEnter", {
		group = highlight_group,
		callback = function()
			setup_highlights()
		end,
	})

	-- Folds
	-- vim.o.foldmethod = 'indent'
	-- -- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	-- vim.o.foldcolumn = '1'
	-- --
	-- vim.cmd("silent! loadview"); -- again command needs to be called outside of autogroup to affect first file
	--
	-- local fold_group = vim.api.nvim_create_augroup("Folds", {clear = true})
	-- --
	-- vim.api.nvim_create_autocmd("BufWinEnter", {
	-- 	group = fold_group,
	-- 	pattern = "*.*",
	-- 	command = "silent! loadview",
	-- })
	--
	-- vim.api.nvim_create_autocmd("BufWinLeave", {
	-- 	group = fold_group,
	-- 	pattern = "*.*",
	-- 	command = "mkview",
	-- })
end
return M
