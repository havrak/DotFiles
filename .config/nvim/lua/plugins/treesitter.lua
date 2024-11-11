local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- dependencies = "windwp/nvim-ts-autotag",
	event = "VeryLazy",
}

function M.config()
	require'nvim-treesitter.configs'.setup {
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
			enable = true,              -- false will disable the whole extension
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false -- Whether the query persists across vim sessions
		},
		autotag = {enable = true},
		rainbow = {enable = true},
		refactor = {
			highlight_definitions = {
				enable = true
			}
		}
	}
	vim.cmd('hi WARN			term=standout guibg=white guifg=red		ctermbg=white ctermfg=red')
	vim.cmd('hi NOTE				term=standout guifg=blue	guibg=white ctermbg=blue	ctermfg=white')
	vim.cmd('hi INFO		term=bold			guibg=green guifg=white ctermbg=green ctermfg=white')

	function setup_highlights()
				vim.fn.matchadd("NOTE", "TODO")
				vim.fn.matchadd("NOTE", "NOTE")
				vim.fn.matchadd("WARN", "DELETE")
				vim.fn.matchadd("WARN", "XXX")
				vim.fn.matchadd("WARN", "WARN")
				vim.fn.matchadd("INFO", "INFO")
				vim.fn.matchadd("INFO", "OPTIONAL")
				vim.fn.matchadd("INFO", "DONE")
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
	vim.o.foldmethod = 'expr'
	vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.o.foldcolumn = '1'

	vim.cmd("silent! loadview"); -- again command needs to be called outside of autogroup to affect first file

	local fold_group = vim.api.nvim_create_augroup("Folds", {clear = true})

	vim.api.nvim_create_autocmd("BufWinEnter", {
		group = fold_group,
		pattern = "*.*",
		command = "silent! loadview",
	})

	vim.api.nvim_create_autocmd("BufWinLeave", {
		group = fold_group,
		pattern = "*.*",
		command = "mkview",
	})


end
return M

