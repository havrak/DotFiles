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

vim.api.nvim_create_autocmd("FileType", {
	group = general_settings_group,
	pattern = { "typst" },
	callback = function(args)
		local opts = { buffer = args.buf, noremap = true, silent = true }
		vim.keymap.set(
			"n",
			"<leader>p",
			"<Cmd>TypstPreview<CR>",
			vim.tbl_extend("force", opts, { desc = "Typst: Live Preview" })
		)

		vim.keymap.set("n", "<leader>c", function()
			vim.cmd("w!")
			vim.cmd("!tinymist compile %")
		end, vim.tbl_extend("force", opts, { desc = "Typst: Compile PDF" }))

		vim.keymap.set("n", "F", function()
			vim.lsp.buf.format({ async = true })
		end, vim.tbl_extend("force", opts, { desc = "LSP: Format Typst" }))
	end,
})

local format_group = vim.api.nvim_create_augroup("SchemaFormatter", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = format_group,
  pattern = "*/parsing-schemas/*.json",
  callback = function()
    local current_file_dir = vim.fn.expand("<afile>:p:h")
    local formatter_script = current_file_dir .. "/format_schema.py"

    vim.keymap.set("n", "F", function()
      if vim.fn.executable(formatter_script) == 1 then
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        vim.cmd("%!" .. vim.fn.shellescape(formatter_script))

        pcall(vim.api.nvim_win_set_cursor, 0, cursor_pos)
      else
        vim.notify("Formatter script not found or not executable at: " .. formatter_script, vim.log.levels.ERROR)
      end
    end, { buffer = true, silent = true, desc = "Format custom parsing schema JSON" })
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
