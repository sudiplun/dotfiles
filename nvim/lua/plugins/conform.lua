return { -- Autoformat
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
		-- New keybinding to toggle conform.nvim
		{
			"<leader>cF",
			function()
				vim.g.conform_enabled = not vim.g.conform_enabled
				local status = vim.g.conform_enabled and "enabled" or "disabled"
				vim.notify("Conform.nvim is now " .. status .. ".", vim.log.levels.INFO)
			end,
			mode = { "n", "v" },
			desc = "[C]onform toggle [F]ormat on save",
		},
	},
	opts = {
		notify_on_error = false,
		-- Default to enabled if not set
		format_on_save = function(bufnr)
			if vim.g.conform_enabled == nil then
				vim.g.conform_enabled = true
			end

			if not vim.g.conform_enabled then
				return
			end

			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			local lsp_format_opt
			if disable_filetypes[vim.bo[bufnr].filetype] then
				lsp_format_opt = "never"
			else
				lsp_format_opt = "fallback"
			end
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			-- You can use 'stop_after_first' to run the first available formatter from the list
			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier" },
			scss = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			yaml = { "yamlfmt" },
			go = { "gopls" },
			python = { "ruff" },
			tf = { "terraform" },
			graphql = { "prettierd", "prettier" },
			md = { "prettierd", "prettier" },
			txt = { "prettierd", "prettier" },
		},
	},
}
