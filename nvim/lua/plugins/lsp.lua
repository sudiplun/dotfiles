-- if true then
-- 	return {}
-- end
return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },

	{ -- lsp config
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("plugins.lsp.lsp-keymaps").setup()

			-- info neovim what LSP is capabile
			-- Capabilities and server configurations
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			--load from lsp/servers
			local servers = {
				require("plugins.lsp.servers.vtsls"),
				require("plugins.lsp.servers.lua_ls"),
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
