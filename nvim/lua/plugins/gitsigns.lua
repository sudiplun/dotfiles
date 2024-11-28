-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	lazy = true, -- Disable loading at startup
	event = { "VeryLazy" },
	-- event = { "BufReadPre", "BufNewFile" }, -- Trigger on file open

	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		-- 	signs = {
		-- 		add = { text = "┃" },
		-- 		change = { text = "┃" },
		-- 		delete = { text = "_" },
		-- 		topdelete = { text = "‾" },
		-- 		changedelete = { text = "~" },
		-- 		untracked = { text = "┆" },
		-- 	},
		-- 	signs_staged = {
		-- 		add = { text = "┃" },
		-- 		change = { text = "┃" },
		-- 		delete = { text = "_" },
		-- 		topdelete = { text = "‾" },
		-- 		changedelete = { text = "~" },
		-- 		untracked = { text = "┆" },
		-- 	},
	},
	-- config = function(_, opts)
	-- 	-- Check if the current project is a Git repository
	-- 	if vim.fn.isdirectory(vim.fn.expand("%:p:h") .. "/.git") == 1 then
	-- 		require("gitsigns").setup(opts)
	-- 	end
	-- end,
}
