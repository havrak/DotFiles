return {
	{'morhetz/gruvbox', lazy = false,
	priority = 999,
	config = function()
		vim.cmd.colorscheme 'gruvbox'
		vim.g.gruvbox_italic = 1
		vim.g.gruvbox_contrast_dark = 'hard'
	end
	},
	 {'rbgrouleff/bclose.vim', event = "VeryLazy"},

	{'kyazdani42/nvim-web-devicons', event = "VeryLazy"},
	
	{'lukas-reineke/indent-blankline.nvim',
		opts = {
		char = '┊',
		show_trailing_blankline_indent = false,
		}
	},
	{ 'numToStr/Comment.nvim', event = "VeryLazy", opts = {} },
}
