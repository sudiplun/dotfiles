return {
	--lua
	"folke/lazydev.nvim",
	lazy = true,
	ft = "lua",
	opts = {
		library = {
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
			-- { path = "snacks.nvim", words = { "Snacks" } },
			-- { path = "lazy.nvim", words = { "LazyVim" } },
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
}
