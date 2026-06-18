return {
	"windwp/nvim-autopairs",
	event = "InsertEnter", -- Better practice: Defer loading until you actually start typing
	opts = {
		check_ts = true, -- Enable Treesitter integration
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
		ts_config = {
			lua = { "string", "source" },
			javascript = { "string", "template_string" },
			java = false,
		},
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
			offset = 0,
			end_key = "$",
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			check_comma = true,
			highlight = "PmenuSel",
			highlight_grey = "LineNr",
		},
	},
}
