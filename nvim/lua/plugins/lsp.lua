return {
	{
		"j-hui/fidget.nvim", -- keep for LSP progress UI
		event = "LspAttach",
		opts = {},
	},
	{
		-- lazydev for vim API completion in lua files (replaces the old neodev)
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- This is just a dummy plugin entry to hook LSP setup into lazy's lifecycle
		"neovim/nvim-lspconfig", -- optional: only for the lsp/ config files it ships
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("config.lsp-remaps").setup()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })

			-- Enable all servers — matches filenames in your lsp/ folder
			vim.lsp.enable({
				"lua_ls",
				"yamlls",
				"gopls",
				"basedpyright",
				"bashls",
			})
		end,
	},
}
