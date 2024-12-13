if true then return {} end -- WARN: remove this line to active plugin
return {
	"folke/which-key.nvim",
	lazy = true,
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<BS>", desc = "Decrement Selection", mode = "x" },
			{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
		},
	},
}
