return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	lazy = true, -- Disable loading at startup
	event = { "BufReadPost", "InsertEnter" }, -- Load when opening a file or creating a new one
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- buffer tabline
		require("mini.tabline").setup()

        -- mini-icons
		require("mini.icons").setup()

		-- -- file tree
		require("mini.files").setup()
		vim.keymap.set("n", "-", function()
			-- focus on buffer path
			local buf_name = vim.api.nvim_buf_get_name(0)
			local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
			MiniFiles.open(path)
			MiniFiles.reveal_cwd()
		end, { desc = "Open Mini Files" })
		--
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
