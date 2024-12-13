return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	event = "BufReadPre",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	---@diagnostic disable
	opts = {
		ensure_installed = {
			"bash",
			"css",
			"html",
			"javascript",
			"json",
			"jsonc",
			"tsx",
			"lua",
			"luadoc",
			"markdown",
			"typescript",
			"toml",
			"vim",
		},
		sync_install = false,
		-- Autoinstall languages that are not installed
		auto_install = true,
		autotag = { enable = true },
		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		indent = { enable = true },
	},
}
