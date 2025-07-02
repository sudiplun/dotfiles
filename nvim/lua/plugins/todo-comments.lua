-- local Snacks = require("snacks")
return {
	"folke/todo-comments.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- Load only for project files
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>st",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>sT",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "Todo/Fix/Fixme",
		},
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
	},
	opts = {},
}
