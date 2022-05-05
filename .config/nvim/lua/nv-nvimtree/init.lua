vim.o.termguicolors = true

vim.g.nvim_tree_side = "left"
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_auto_ignore_ft = { "startify"}

vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}



local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
	disable_netrw = true,
	hijack_netrw = true,
	ignore_ft_on_setup = {"startify"},
	update_focused_file = {enable = true, update_cwd = true},
	filters = {dotfiles = true, custom = {".git", "node_modules", ".cache"}},

	view = {
		width = 25,
		mappings = {
			custom_only = false;
			list ={
    { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
    { key = "h", cb = tree_cb "close_node" },
    { key = "v", cb = tree_cb "vsplit" },

			}
		}
	}
}

local view_status_ok, view = pcall(require, "nvim-tree.view")
if not view_status_ok then
  return
end
