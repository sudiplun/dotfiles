return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPost", "BufNewFile" }, -- Smarter loading: triggers when a file is opened or created
	opts = {
		filetypes = { "css", "html" }, -- Active filetypes
		render = "background", -- Options: 'background', 'foreground', or 'first_column'
		enable_hex = true,
		enable_short_hex = true,
		enable_rgb = true,
		enable_hsl = true,
		enable_var_usage = true,
		enable_named_colors = true,
		enable_tailwind = false,
	},
}
