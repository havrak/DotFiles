vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Fix indenting visual blocks
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set('v', '?', '<gv', { silent = true })
vim.keymap.set('v', ':', '>gv', { silent = true })

-- Binding to get to TERMINAL mode
vim.keymap.set('n', '?', ':', { silent = true })
vim.keymap.set('n', 'ů', ':', { silent = true })

-- Shortcuts for navigation
vim.keymap.set('n', '<C-Left>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { silent = true })

-- Shortcuts for resizing windows
vim.keymap.set('n', '<C-h>', ':vertical resize -5<CR>', {silent = true })
vim.keymap.set('n', '<C-j>', ':resize +5<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', ':resize -5<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':vertical resize +5<CR>', { silent = true })

-- Working with buffers
vim.keymap.set('n', 'gt', ':bnext<CR>', { silent = true })
vim.keymap.set('n', 'gT', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', 'Q', ':w\\|Bclose<CR>', { silent = true })
vim.keymap.set('n', '<C-q>', ':Bclose!<CR>', { silent = true })

-- Replace selected text
vim.keymap.set('n', 'S', ':%s///g<Left><Left>', { silent = true })
vim.keymap.set('x', 'S', ':s///g<Left><Left>', { silent = true })

