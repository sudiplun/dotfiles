return {
	"saghen/blink.cmp",
	lazy = true,
	event = "LspAttach",
	dependencies = {
		"saghen/blink.lib",
		"rafamadriz/friendly-snippets",
		"mikavilpas/blink-ripgrep.nvim",
	},
	build = function()
		require("blink.cmp").build():pwait()
	end,
	opts = {
		keymap = { preset = "default" },
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
		},
		sources = {
			default = { "lsp", "lazydev", "path", "snippets", "buffer", "ripgrep" }, -- Added "cmdline"
			providers = {
				lsp = {
					name = "LSP",
					score_offset = 400, -- Increase this value to prioritize LSP
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100, -- higher the number higher the prioritize
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					score_offset = 50,
					opts = {},
				},
			},
		},
		fuzzy = { implementation = "lua" }, -- might be rust but got consistency error
		cmdline = {
			keymap = { preset = "inherit" },
			completion = { menu = { auto_show = true } },
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
