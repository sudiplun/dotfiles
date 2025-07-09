return {
	{ -- lsp config
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- LSP Support
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			-- Extensible UI for Neovim notifications and LSP progress messages.
			{ "j-hui/fidget.nvim" },
		},
		config = function()
			require("plugins.lsp.lsp-remaps").setup()
			-- lsp config
			local servers = require("plugins.lsp.servers")
			-- autocompletion Support
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- mason setup
			require("mason").setup()
			-- Configure mason-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"yamlls",
				},
				handlers = {
					function(server_name)
						local opts = servers[server_name] or {}
						opts.capabilities = capabilities
						require("lspconfig")[server_name].setup(opts)
					end,
				},
			})
		end,
	},
}
