local M = {}

M.cmd = { "cspell-lsp", "--stdio" }
M.filetypes = {
  "lua",
  "python",
  "javascript",
  "typescript",
  "markdown",
  "gitcommit",
	"c++",
	"c",
	"tex",
}
M.root_markers = { ".git", "cspell.json" } -- It will look for a cspell.json config

return M
