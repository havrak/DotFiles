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
	vim.fn.matchadd("Todo", "TODO")
	vim.fn.matchadd("Todo", "NOTE")
	vim.fn.matchadd("Todo", "WARN")
	vim.fn.matchadd("Todo", "DELETE")

end
return M
