local M = { 'notjedi/nvim-rooter.lua', lazy = false}

function M.config()
require('nvim-rooter').setup {
  rooter_patterns = { '.git', '.hg', '.svn' },
  trigger_patterns = { '*' },
  manual = false,
  fallback_to_parent = false,
}

end

return M
