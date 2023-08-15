local M = {"ibhagwan/fzf-lua", event = "VeryLazy"}
function M.config()
	local fzf = require "fzf-lua"
	fzf.setup {
		fzf_colors = {
			hl = {"fg", "LightBlue"},
			gutter = {"bg", "Bg1"},
			prompt = {"fg", "FloatTitle", "bold"},
			info = {"fg", "Number"},
			pointer = {"fg", "Red"},
			marker = {"fg", "Operator", "bold"},
			separator = {"bg", "Normal"},
			["hl+"] = {"fg", "Search"},
			["fg+"] = {"fg", "Fg1"},
			["bg+"] = {"bg", "Bg2"},
		},
		files = {
			prompt = "Files> ",
			git_icons = false,
			fd_opts = [[--color=never --type f --follow -E 'Android' \
		-E node_modules -E 'incremental' -E 'deps' -E 'build' -S '-500k']],
		},
		lsp = {jump_to_single_result = true, ignore_current_line = true},
	}

	vim.lsp.handlers["textDocument/declaration"] = fzf.lsp_declarations
	vim.lsp.handlers["textDocument/definition"] = fzf.lsp_definitions
	vim.lsp.handlers["textDocument/references"] = fzf.lsp_references
	vim.lsp.handlers["textDocument/implementation"] = fzf.lsp_implementation

	vim.keymap.set("n", "//", fzf.grep_project)
	vim.keymap.set("n", "<Leader>s", function() fzf.files({cwd = vim.api.nvim_buf_get_name(0):gsub("[^/]+$", "")}) end)
	vim.keymap.set("n", "<Leader>f", fzf.files)
	vim.keymap.set("n", "<Leader>d", fzf.lsp_workspace_diagnostics)
	vim.keymap.set("n", "<Leader>t", fzf.highlights)
end
return M
