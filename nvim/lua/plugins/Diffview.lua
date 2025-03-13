return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen"},
	opts = {},
	keys = {
		{
			"<leader>gv",
			function()
				local diffview = require("diffview.lib")
				if next(diffview.views) == nil then
					vim.cmd("DiffviewOpen")
				else
					vim.cmd("DiffviewClose")
				end
			end,
			mode = "n",
			desc = "Git diff Index",
		},
	},
}
