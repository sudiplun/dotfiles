-- if true then return {} end
return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	lazy = true,
	event = { "BufReadPost", "InsertEnter" }, -- Load when opening a file or creating a new one
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ i_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- buffer tabline
--		require("mini.tabline").setup()

		-- mini-icons
		require("mini.icons").setup()

		-- statusline
		local statusline = require("mini.statusline")
		statusline.setup()
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
