local M = {"kyazdani42/nvim-tree.lua", event = "VeryLazy", dependencies = "kyazdani42/nvim-web-devicons"}

function M.config()
	local tree_cb = require'nvim-tree.config'.nvim_tree_callback

	local function on_attach(bufnr)
		local api = require('nvim-tree.api')

		local function opts(desc)
			return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		vim.keymap.set('n', 'O', '', { buffer = bufnr })
		vim.keymap.del('n', 'O', { buffer = bufnr })
		vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })
		vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })
		vim.keymap.set('n', 'D', '', { buffer = bufnr })
		vim.keymap.del('n', 'D', { buffer = bufnr })
		vim.keymap.set('n', 'E', '', { buffer = bufnr })
		vim.keymap.del('n', 'E', { buffer = bufnr })


	end

	require'nvim-tree'.setup {
		disable_netrw = true,
		hijack_netrw = true,
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true
		},
		filters = {dotfiles = true, custom = {".git", "node_modules", ".cache"}},
		on_attach = on_attach,
		view = {
			width = 25,
			preserve_window_proportions = true,
			side = "left",
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
	local function open_nvim_tree(data)
		local IGNORED_FT = {
			"startify",
		}

		-- buffer is a real file on the disk
		local real_file = vim.fn.filereadable(data.file) == 1

		-- buffer is a [No Name]
		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

		-- &ft
		local filetype = vim.bo[data.buf].ft

		-- only files please
		if not real_file and not no_name then
			return
		end

		-- skip ignored filetypes
		if vim.tbl_contains(IGNORED_FT, filetype) then
			return
		end

		-- open the tree but don't focus it
		require("nvim-tree.api").tree.toggle({ focus = false })
	end
	local view_status_ok, view = pcall(require, "nvim-tree.view")
	if not view_status_ok then
		return
	end
	vim.keymap.set("n", "<F4>", "<Cmd>NvimTreeToggle<CR>", {silent = true})
end
return M
