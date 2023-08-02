return {

	{'morhetz/gruvbox', lazy = false,
	priority = 999,
	config = function()
		vim.cmd.colorscheme 'gruvbox'
		vim.g.gruvbox_italic = 1
		vim.g.gruvbox_contrast_dark = 'hard'
	end
	},
	{'rbgrouleff/bclose.vim', event="VeryLazy"},
	{'airblade/vim-rooter', lazy = false},

	{'lukas-reineke/indent-blankline.nvim', event = "VeryLazy",
		opts = {
		char = '┊',
		show_trailing_blankline_indent = false,
		}
	},

	{ 'numToStr/Comment.nvim', event = "VeryLazy", opts = {} },

	{ 'preservim/tagbar', event = "VeryLazy"},

	{ 'github/copilot.vim', event = "VeryLazy", config = function()
		vim.g.copilot_enabled = true
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
	end},

	{'airblade/vim-rooter', event = "VeryLazy" , config = function()
		vim.g.rooter_patterns = "['.git', '.hg', '.bzr', '.svn']"
	end},
}
