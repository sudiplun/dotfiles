return {
	"lewis6991/gitsigns.nvim",
	-- lazy = true, -- Disable loading at startup
	event = "BufReadPre",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
	-- config = function(_, opts)
	-- 	-- Check if the current project is a Git repository
	-- 	if vim.fn.isdirectory(vim.fn.expand("%:p:h") .. "/.git") == 1 then
	-- 		require("gitsigns").setup(opts)
	-- 	end
	-- end,
}
