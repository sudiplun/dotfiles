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
	cssls = {
		settings = {
			css = {
				lint = {
					emptyRules = "ignore",
					duplicateProperties = "warning",
				},
			},
			scss = {
				lint = {
					idSelector = "warning",
					zeroUnits = "warning",
					duplicateProperties = "warning",
					emptyRules = nil,
				},
				completion = {
					completePropertyWithSemicolon = true,
					triggerPropertyValueCompletion = true,
				},
			},
		},
		on_attach = function(client)
			client.server_capabilities.document_formatting = false
		end,
	},
	yamlls = {
		settings = {
			yaml = {
				keyOrdering = false,
				format = { enable = true },
				validate = true,
				schemaStore = { enable = true },
			},
		},
	},
}
