return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	keys = {
		-- 1. Original Grug-Far Window with auto-extension filtering
		{
			"<leader>sr",
			function()
				local grug = require("grug-far")
				local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
				grug.open({
					transient = true,
					prefills = {
						filesFilter = ext and ext ~= "" and "*." .. ext or nil,
					},
				})
			end,
			mode = { "n", "x" },
			desc = "Grug-Far: Search and Replace",
		},
	},
	opts = {
		headerMaxWidth = 80,
		-- Define your standalone configurations directly within the opts block
		icons = {
			enabled = true, -- Leverage Nerd Fonts icon elements cleanly
		},
	},
}
