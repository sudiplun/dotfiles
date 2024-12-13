vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

--move line up-down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

--Exit insert mode without hitting escape
map("i", "jk", "<Esc>", { desc = "Esc" })

-- map({ "n", "x" }, "<leader>y", [["+y]]) -- yank to clipboard register ("+)
-- map({ "n", "x" }, "<leader>d", [["+d]]) -- delete to clipboard register ("+)
-- map({ "n", "x" }, "<leader>p", [["+p]]) -- put from clipboard register ("+=)

-- file mananger
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Toggle open netrw" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window", remap = true })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window", remap = true })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window", remap = true })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bo", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but not current one" })
-- replace by snacks buf
-- map("n", "<leader>bD", "<cmd>:bd!<cr>", { desc = "Delete Buffer and Window(!save file)" }) -- not others buffer
-- map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "delete the buffer" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- quit
--map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- windows
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
