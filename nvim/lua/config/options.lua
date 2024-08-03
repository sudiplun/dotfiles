-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
--  wrap enable on Default
opt.wrap = true
-- see tab file name
opt.winbar = "%=%m %f"
-- escape
vim.keymap.set("i", "jk", "<Esc>")
