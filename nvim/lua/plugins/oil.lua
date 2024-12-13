if true then
	return {}
end
return {
	"stevearc/oil.nvim",
	-- lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
	},
	opts = {
		delete_to_trash = true,
		default_file_explorer = true,
	},
}
