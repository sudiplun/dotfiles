return {
	"ibhagwan/fzf-lua",
	lazy = true,
	requires = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
	config = function()
		local fzf = require("fzf-lua")
		-- Configure fzf-lua here

		-- Keymaps equivalent to your Telescope setup
		vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", fzf.builtin, { desc = "[S]earch [S]elect fzf-lua" })
		vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", fzf.diagnostics_workspace, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><space>", fzf.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>sc", fzf.colorschemes, { desc = "[S] colorscheme" })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			fzf.lgrep_curbuf({ winopts = { height=0.50, width=0.50} })
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- Additional configuration options for live_grep
		vim.keymap.set("n", "<leader>s/", function()
			fzf.live_grep({
				grep_cmd = "rg --hidden --column --line-number --no-heading --color=always --smart-case -g '!{.git,node_modules}/*'",
				prompt = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			fzf.files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
