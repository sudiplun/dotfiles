return {
	{ -- lsp config
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- LSP Support
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Extensible UI for Neovim notifications and LSP progress messages.
			{ "j-hui/fidget.nvim", opts = {} },
		},

		config = function(_, opts)
			require("plugins.lsp.lsp-remaps").setup()

			-- Info neovim what LSP is capable of
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Load from lsp/servers
			local servers = require("plugins.lsp.servers")

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
						opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)
						require("lspconfig")[server_name].setup(opts)
					end,
				},
			})
		end,
	},
}
