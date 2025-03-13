return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	keys = {
		{
			"<leader>sr",
			"<cmd>GrugFar<CR>",
			desc = "Search and Replace",
		},
	},
	config = function()
		require("grug-far").setup({
			-- Your plugin-specific configurations
		})
	end,
}
