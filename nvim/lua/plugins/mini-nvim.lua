return {
	-- 1. Mini.ai (Text Objects)
	{
		"echasnovski/mini.nvim",
		event = "BufReadPost",
		config = function()
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ i_lines = 500 })
		end,
	},
	-- 3. Mini.icons & Mini.statusline (UI Layer)
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy", -- Loads immediately after startup processing completes
		config = function()
			-- Global icon provider
			require("mini.icons").setup()

			-- Statusline setup
			local statusline = require("mini.statusline")
			statusline.setup()

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}
