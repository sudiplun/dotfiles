return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			preset = {
				header = [[Only focus on What's in your control]],
			},
		},
		explorer = {},
		indent = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		quickfile = { enabled = true },
		picker = { enabled = true },
		--statuscolumn = { enabled = true },
		words = { enabled = true },

		toggle = {},
		--scroll = {},
		zen = {},
		-- styles of style
		-- just see
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
	},
-- stylua: ignore
	keys = {
    {"-",function () Snacks.explorer() end, desc="file explorer"},
		{"<leader>.",function()Snacks.scratch()end,desc = "Toggle Scratch Buffer",},
		{"<leader>S",function()Snacks.scratch.select()end,desc = "Select Scratch Buffer",},
		{"<leader>n",function()Snacks.notifier.show_history()end,desc = "Notification History",},
        --buffer
		{"<leader>bd",function()Snacks.bufdelete()end,desc = "Delete Buffer",},
		{"<leader>bo",function()Snacks.bufdelete.other()end,desc = "Delete other buffer except the current one",},
		{"<leader>cR",function()Snacks.rename.rename_file()end,desc = "Rename File",},
        --git
		{"<leader>gB",function()Snacks.gitbrowse()end,desc = "Git Browse",},
		{"<leader>gb",function()Snacks.git.blame_line()end,desc = "Git Blame Line",},
        --lazygit 
		{"<leader>gf",function()Snacks.lazygit.log_file()end,desc = "Lazygit Current File History",},
		{"<leader>gg",function()Snacks.lazygit()end,desc = "Lazygit",},
		{"<leader>gl",function()Snacks.lazygit.log()end,desc = "Lazygit Log (cwd)",},
		{"<leader>un",function()Snacks.notifier.hide()end,desc = "Dismiss All Notifications",},
		{"<c-/>",function()Snacks.terminal()end,desc = "Toggle Terminal",},
		{"<leader>zz",function()Snacks.zen()end,desc = "zen mode",},
		{"]]",function()Snacks.words.jump(vim.v.count1)end,desc = "Next Reference",mode = { "n", "t" },},
		{"[[",function()Snacks.words.jump(-vim.v.count1)end,desc = "Prev Reference",mode = { "n", "t" },},

    --picker keymaps
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    -- git
    { "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    -- Grep
    { "<leader>/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    { "<leader>qp", function() Snacks.picker.projects() end, desc = "Projects" },

    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },

	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command
				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle.dim():map("<leader>uD")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
			end,
		})
	end,
}
