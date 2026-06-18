return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		name = "tokyonight",
		init = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"rose-pine/neovim",
		lazy = "true",
	},
}
