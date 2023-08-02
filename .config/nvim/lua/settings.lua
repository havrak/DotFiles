
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.encoding = 'utf-8'
vim.g.termencoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.clipboard = 'unnamedplus'
vim.wo.signcolumn = 'yes'
vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.hidden = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.foldmethod = 'syntax'
vim.o.foldcolumn = '1'
vim.o.incsearch = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.undofile= true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.wildchar = vim.o.wildchar .. '<Tab>,<Down>,<Up>,<Left>,<Right>,<Space>,<BS>,<CR>,<Esc>'
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'
vim.o.wildignore = vim.o.wildignore .. '*.o,*~,*.pyc,*.DS_Store,*.egg-info,*.egg,*.git,*.svn,*.hg,*.png,*.jpg,*.jpeg,*.bmp,*.gif,*.ico,*.pdf,*.dvi,*.ps,*.zip,*.tar.gz,*.tar.bz2,*.tar.xz,*.rar,*.tar,*.pyc,__pycache__'
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.api.nvim_exec([[
	hi DELETE			term=bold	guibg=#fb4934 guifg=#1a1a1a ctermfg=black ctermbg=red
	hi WARNING	  term=bold	guibg=#fb4934	guifg=#1a1a1a ctermfg=black ctermbg=red
	hi NOTE				term=bold	guibg=#83a598	guifg=#1a1a1a ctermfg=black ctermbg=blue
	hi TODO				term=bold	guibg=#fabd2f	guifg=#1a1a1a ctermfg=black ctermbg=yellow
	hi DONE				term=bold	guibg=#8BC34A	guifg=#1a1a1a ctermfg=black ctermbg=yellow
]], false)

vim.fn.matchadd('DELETE', 'DELETE')
vim.fn.matchadd('TODO','TODO')
vim.fn.matchadd('DONE','DONE')
vim.fn.matchadd('NOTE','NOTE')
vim.fn.matchadd('WARNING', 'WARNING')
