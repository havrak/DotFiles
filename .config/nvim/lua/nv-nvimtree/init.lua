vim.o.termguicolors = true

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
	disable_netrw = true,
	hijack_netrw = true,
	ignore_ft_on_setup = {"startify"},
	update_focused_file = {enable = true, update_cwd = true},
	filters = {dotfiles = true, custom = {".git", "node_modules", ".cache"}},
	view = {
		width = 25,
    preserve_window_proportions = true,
    side = "left",
		mappings = {
			custom_only = false;
			list ={
				{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
				{ key = "h", cb = tree_cb "close_node" },
				{ key = "v", cb = tree_cb "vsplit" },

			}
		}
	},
	renderer = {
    highlight_opened_files = "none",
    root_folder_modifier = ":t",
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
			glyphs = {
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
				}
			}
		}
	}
}

local view_status_ok, view = pcall(require, "nvim-tree.view")
if not view_status_ok then
	return
end
