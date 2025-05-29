return {
	"saghen/blink.cmp",
	event = "LspAttach",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"mikavilpas/blink-ripgrep.nvim",
		-- "saghen/blink.compat", -- Uncomment if you need compatibility features
	},
	version = "1.*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
			-- You might want to explore more appearance options like `border` or `scrollbar`
			-- border = "rounded",
			-- scrollbar = true,
		},
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
		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "lazydev", "path", "snippets", "buffer", "ripgrep" }, -- Added "cmdline"
			providers = {
				lsp = {
					name = "LSP",
					score_offset = 400, -- Increase this value to prioritize LSP
					-- You can also add `option` like `keyword_length` or `trim_snippet_text`
					-- keyword_length = 3,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100, -- higher the number higher the prioritize
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					score_offset = 100,
					opts = {},
				},
			},
		},
		cmdline = {
			keymap = { preset = "inherit" },
			completion = { menu = { auto_show = true } },
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
