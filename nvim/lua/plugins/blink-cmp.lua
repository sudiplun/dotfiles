return {
	"saghen/blink.cmp",
	event = "LspAttach",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "v0.*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			accept = {
				-- experimental auto-brackets support
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
			-- compact = {},
			default = { "lsp", "path", "snippets", "buffer" },
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
