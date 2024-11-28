return {
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true, -- Disable loading at startup
		event = { "BufReadPre", "BufNewFile" }, -- Load only for project files
		main = "ibl",
		opts = {
			-- Exclude certain file types
			exclude = {
				filetypes = { "dashboard", "alpha", "NvimTree", "lazy" }, -- Add more as needed
			},
		},
	},
}
