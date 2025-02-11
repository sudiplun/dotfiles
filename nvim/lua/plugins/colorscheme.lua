return {
	{
		"rose-pine/neovim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		name = "rose-pine",
		init = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = "true",
	},
}
