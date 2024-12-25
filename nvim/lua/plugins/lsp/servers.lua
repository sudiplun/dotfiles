return {
	-- Lua LSP
	lua_ls = {
		settings = {
			Lua = {
				-- Improve completion
				completion = {
					callSnippet = "Replace",
				},
				-- Diagnostics configuration
				diagnostics = {
					-- Recognize the vim global
					globals = { "vim" },
					-- Disable specific warnings
					disable = {
						"missing-fields",
						"incomplete-signature-doc",
					},
				},
				-- Improve type checking
				typeChecking = {
					enable = true,
				},
			},
		},
	},
	-- Vtsls
	vtsls = {},
	-- End of TS LSP
}
