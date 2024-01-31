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

	{ 'github/copilot.vim', event = "VeryLazy", priority = 0, config = function()
		vim.g.copilot_enabled = 1
		vim.g.copilot_assume_mapped = 1
	end},

	{ 'Chiel92/vim-autoformat', event = "VeryLazy", config = function()
		vim.g.formatdef_latexindent = '"latexindent --logfile=/dev/null --local=$HOME/.config/latexindent/config.yaml -"'
	end},

	{'dhruvasagar/vim-table-mode' , event="VeryLazy"},

	{'aperezdc/vim-template' , event = "VeryLazy", config = function()
		vim.g.email="krystof@havrak.xyz"
		vim.g.username="Havránek Kryštof"
		vim.g.templates_directory= '$HOME/.config/nvim/templates'
		vim.g.templates_no_autocmd = 0
	end}
}
