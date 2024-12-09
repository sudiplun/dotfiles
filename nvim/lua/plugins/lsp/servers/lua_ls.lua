return {
	-- Lua Language Server Configuration
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

				-- Workspace configuration
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},

					-- Disable telemetry
					telemetry = { enable = false },
				},

				-- Improve type checking
				typeChecking = {
					enable = true,
				},
			},
		},
	},
}
