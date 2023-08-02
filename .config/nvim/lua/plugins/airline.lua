local M =  {
    -- Set lualine as statusline
    'vim-airline/vim-airline',
    -- See `:help lualine.txt`
		dependencies= {
			'vim-airline/vim-airline-themes',
		},
		lazy = false,
  }

function M.config()

vim.g.airline_powerline_fonts = 1
vim.g.airline_theme='gruvbox'
vim.g.airline_left_sep = ''
vim.g.airline_right_sep = ''
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#tab_nr_type'] = 1
vim.g['airline#extensions#tabline#fnametruncate'] = 30
vim.g['airline#extensions#tabline#fnamemod'] = ':t'
vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
vim.g['airline#extensions#wordcount#filetypes'] = '\vasciidoc|help|mail|markdown|markdown.pandoc|org|rst|tex|text|wiki'
vim.g['airline#extensions#wordcount#enabled'] = 1
vim.g['airline#extensions#whitespace#enabled'] = 0
vim.g['airline#extensions#coc#enabled'] = 1



vim.keymap.set("n", "<F1>", "<Plug>AirlineSelectTab1")
vim.keymap.set("n", "<F2>", "<Plug>AirlineSelectTab2")
vim.keymap.set("n", "<F3>", "<Plug>AirlineSelectTab3")
vim.keymap.set("n", "<F4>", "<Plug>AirlineSelectTab4")
vim.keymap.set("n", "<F5>", "<Plug>AirlineSelectTab5")
vim.keymap.set("n", "<F6>", "<Plug>AirlineSelectTab6")
vim.keymap.set("n", "<F7>", "<Plug>AirlineSelectTab7")
vim.keymap.set("n", "<F8>", "<Plug>AirlineSelectTab8")
vim.keymap.set("n", "<F9>", "<Plug>AirlineSelectTab9")
vim.keymap.set("n", "<F10>", "<Plug>AirlineSelectTab0")

end
return M
