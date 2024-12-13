-- if true then
-- 	return {}
-- end
return {
	"mfussenegger/nvim-lint",
	-- Event to trigger linters
	lazy = true,
	events = { "BufWritePost", "BufReadPost", "InsertLeave" },
	opts = {
		linters_by_ft = {
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
		},
	},
	config = function()
		-- Create an augroup for linting
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		-- Setup autocommands to trigger linting
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
