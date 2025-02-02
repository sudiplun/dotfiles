-- define opt variable
local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.cursorline = true
-- Highlight the line number under the cursor
vim.cmd([[
  highlight CursorLineNr guifg=#FFD700 ctermfg=yellow
]])

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"

opt.wrap = true

--  See `:help 'clipboard'`
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 4
opt.expandtab = true

opt.termguicolors = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

--Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = false

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

--fold
opt.foldmethod = indent
opt.foldcolumn = "0"
opt.foldlevel = 99

--netrw related
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
