
local M =  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
		event = "VeryLazy"
    -- See `:help lualine.txt`
  }

function M.config()
	require('lualine').setup {
 		disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
      options = {
        icons_enabled = false,
        theme = 'gruvbox_dark',
        component_separators = '',
        section_separators = '',
      },
		}
end
return M
