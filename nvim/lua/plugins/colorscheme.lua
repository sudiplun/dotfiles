return {
	"rose-pine/neovim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	name = "rose-pine",
	init = function()
		vim.cmd("colorscheme rose-pine")
	end,
}

--tokyo-night

-- return { -- You can easily change to a different colorscheme.
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000, -- Make sure to load this before all the other start plugins.
-- 	init = function()
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 		--		vim.cmd.hi("Comment gui=none")
-- 	end,
-- }
