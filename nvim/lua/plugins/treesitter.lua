return { -- Highlight, edit, and navigate code

	{
		"folke/which-key.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
			spec = {
				{ "<BS>", desc = "Decrement Selection", mode = "x" },
				{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
			},
		},
	},

	"nvim-treesitter/nvim-treesitter",
	--	lazy = true,
	event = "BufReadPre",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	---@diagnostic disable
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"css",
			"diff",
			"html",
			"javascript",
			"json",
			"jsonc",
			"jsx",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"typescript",
			"toml",
			"vim",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		autotag = { enable = true },
		highlight = {
			enable = true,
		},
		indent = { enable = true },
	},

	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		--event = { "BufReadPre", "BufNewFile" }, -- Load only for project files
		ft = {
			"astro",
			"glimmer",
			"handlebars",
			"html",
			"javascript",
			"jsx",
			"markdown",
			"php",
			"rescript",
			"svelte",
			"tsx",
			"twig",
			"typescript",
			"vue",
			"xml",
		},
	},
}
