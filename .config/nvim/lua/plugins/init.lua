return {

	{'havrak/gruvbox', lazy = false,
	priority = 999,
	config = function()
		vim.cmd.colorscheme 'gruvbox'
		vim.g.gruvbox_italic = 1
		vim.g.gruvbox_contrast_dark = 'hard'
	end
},

{'rbgrouleff/bclose.vim', event="VeryLazy"},

{ 'numToStr/Comment.nvim', event = "VeryLazy", opts = {} },

{ 'preservim/tagbar', event = "VeryLazy"},

{ 'github/copilot.vim', event = "VeryLazy", priority=2, config = function()
	vim.g.copilot_enabled = 1
	vim.g.copilot_assume_mapped = 1

	vim.g.copilot_no_tab_map = 1
	vim.keymap.set('i', '<S-CR>', 'copilot#Accept("\\<CR>")', {
		expr = true,
		replace_keycodes = false
	})
	local function loadGitRoot()
		local git_root = vim.fn.trim(vim.fn.system("git rev-parse --show-toplevel"))

		-- If the git root directory is found, set it as the workspace folder for copilot
		if git_root ~= "" then
			vim.g.copilot_workspace_folders = { git_root }
		end
	end
	local timer = vim.loop.new_timer()
	timer:start(3000, 0, vim.schedule_wrap(loadGitRoot)) -- this could be probably done with autogroup (after vim-rooter runs)

end
},
{ 'Chiel92/vim-autoformat', event = "VeryLazy", config = function()
	vim.g.formatdef_latexindent = '"latexindent --logfile=/dev/null --local=$HOME/.config/latexindent/config.yaml -"'
end},

{'aperezdc/vim-template' , event = "VeryLazy", config = function()
	vim.g.email="krystof@havrak.xyz"
	vim.g.username="Havránek Kryštof"
	vim.g.templates_directory= '$HOME/.config/nvim/templates'
	vim.g.templates_no_autocmd = 0
end}
}
