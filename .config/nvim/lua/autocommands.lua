local general_settings_group = vim.api.nvim_create_augroup("GeneralSettings", { clear = true })
local copilot_group = vim.api.nvim_create_augroup("CopilotWorkspace", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = general_settings_group,
	pattern = "*",
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

vim.api.nvim_create_autocmd("FileType", {
	group = general_settings_group,
	pattern = "plaintex",
	command = "set filetype=tex",
})

vim.api.nvim_create_autocmd("FileType", {
	group = general_settings_group,
	pattern = "mail",
	command = "setlocal textwidth=0",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = general_settings_group,
	command = "%s/\\s\\+$//e",
})

-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	group = general_settings_group,
-- 	callback = function() require'vim.highlight'.on_yank {higroup = "Search", timeout = 50} end,
-- })

vim.api.nvim_create_autocmd("InsertEnter", {
	group = general_settings_group,
	command = "normal! zz",
})

vim.api.nvim_create_autocmd("VimLeave", {
	group = general_settings_group,
	pattern = "*.tex",
	command = "!texclear %",
})

vim.api.nvim_create_autocmd("FileType", {
	group = general_settings_group,
	pattern = { "wiki", "vimwiki" },
	callback = function(args)
		vim.g.copilot_enabled = false

		vim.keymap.set("n", "<leader>c", "<Cmd>Vimwiki2HTML<CR>", {
			buffer = args.buf, -- Make this mapping buffer-local
			noremap = true,
			silent = true,
			desc = "Vimwiki: Convert to HTML",
		})

		vim.keymap.set("v", "<leader>t", ":'<,'>! tr -s \" \" | column -t -s '|' -o '|'<CR>", {
			noremap = true,
			silent = true,
			desc = "Format: Align table columns",
		})
	end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = copilot_group,
--   callback = function()
--     -- Get the current git root directory using 'git rev-parse'
--     local git_root = vim.fn.trim(vim.fn.system("git rev-parse --show-toplevel"))
--
--     -- If the git root directory is found, set it as the workspace folder for copilot
--     if git_root ~= "" then
--       vim.g.copilot_workspace_folders = { git_root }
--     end
--   end,
-- })
