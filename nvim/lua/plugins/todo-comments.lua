-- Highlight todo, notes, etc in comments
return {
	"folke/todo-comments.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- Load only for project files
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"tn",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "next marked comment",
		},
		{
			"tp",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "prev marked comment",
		},
		{
			"<leader>st",
			":TodoTelescope<CR>",
			desc = "search todo comments",
		},
	},
	opts = {},
}
