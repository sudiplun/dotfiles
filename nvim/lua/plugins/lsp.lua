return {
	{ -- lsp config
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			--LSP Support
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			--Extensible UI for Neovim notifications and LSP progress messages.
			{ "j-hui/fidget.nvim", opts = {} },
		},

		config = function()
			require("plugins.lsp.lsp-remaps").setup()

			-- info neovim what LSP is capabile
			-- Capabilities and server configurations
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			--load from lsp/servers
			local servers = {

				--lua lsp
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

				-- vtls
				vtsls = {},
				-- end of ts lsp
			}

			require("mason").setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"lua_ls",
				"stylua",
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local opts = servers[server_name] or {}
						opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
						require("lspconfig")[server_name].setup(opts)
					end,
				},
			})
		end,
	},
}
