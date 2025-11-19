return {

	{
		"havrak/gruvbox",
		lazy = false,
		priority = 999,
		config = function()
			vim.cmd.colorscheme("gruvbox")
			vim.g.gruvbox_italic = 1
			vim.g.gruvbox_contrast_dark = "hard"
		end,
	},

	{ "rbgrouleff/bclose.vim", event = "VeryLazy" },

	{ "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },

	{ "preservim/tagbar", event = "VeryLazy" },
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				-- IMPORTANT: Disable ghost text suggestions
				suggestion = { enabled = false },
				panel = { enabled = false },
				filetypes = {
					-- Disable copilot for filetypes you don't want
					markdown = true,
					latex = true,
					tex = true,

					-- ...
				},
			})
		end,
	},
	{
		-- This plugin provides the nvim-cmp source
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua" },
		event = "VeryLazy",
		config = function()
			-- This just needs to be setup
			require("copilot_cmp").setup()
		end,
	},
	{
		"Chiel92/vim-autoformat",
		event = "VeryLazy",
		config = function()
			vim.g.formatdef_latexindent =
				'"latexindent --logfile=/dev/null --local=$HOME/.config/latexindent/config.yaml -"'
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			-- { 'j-hui/fidget.nvim', opts = {} },
		},
		event = "VeryLazy",
		config = function()
			require("mylsp")
		end,
	},
	{
		"folke/lazydev.nvim",
		dependencies = "nvim-lspconfig",
		ft = "lua",
		config = function()
			require("lazydev").setup({})
			require("mylsp").setup("lua_ls")
		end,
	},
	{
		"aperezdc/vim-template",
		event = "VeryLazy",
		config = function()
			vim.g.email = "krystof@havrak.xyz"
			vim.g.username = "Havránek Kryštof"
			vim.g.templates_directory = "$HOME/.config/nvim/templates"
			vim.g.templates_no_autocmd = 0
		end,
	},
}
