local M = {}

-- Get the HOME environment variable
local home = os.getenv("HOME")

-- Correctly build the path to your config file
-- We must separate "--config" and the path into two separate strings in the table.
M.cmd = {
  "cspell-lsp",
  "--config",
  home .. "/.config/cspell/cspell.json",
  "--stdio"
}

M.filetypes = {
  "lua",
  "python",
  "javascript",
  "typescript",
  "markdown",
  "vimwiki",
  "gitcommit",
  "cpp",
  "c",
  "tex",
}
M.root_markers = { ".git" , "cspell.json"}

return M
