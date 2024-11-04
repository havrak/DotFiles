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

-- { 'github/copilot.vim', event = "VeryLazy", config = function()
	--	vim.g.copilot_enabled = 1
	--	vim.g.copilot_assume_mapped = 1
	-- end},
	{
		"zbirenbaum/copilot.lua",
		event = "VeryLazy",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
						layout = {
							position = "bottom"
							ratio = 0.3
						},
					},
					suggestion = {
						enabled = true,
						auto_trigger = true,
						hide_during_completion = false,
						debounce = 50,
						keymap = {
							accept = "<S-CR>",
							accept_word = false,
							accept_line = false,
						},
					},
					filetypes = {
						cpp = true,
						latex = true,
						markdown = true,
						vimwiki = true,
						["."] = true,
					},
					copilot_node_command = 'node', -- Node.js version must be > 18.x
					server_opts_overrides = {
						enable = true,
						inlineSuggest = {
							enable = true,
						}},
					})
				end,
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
