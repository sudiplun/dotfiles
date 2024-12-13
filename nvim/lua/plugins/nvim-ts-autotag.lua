return {
	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		--event = { "BufReadPre", "BufNewFile" }, -- Load only for project files
		ft = {
			"astro",
			"glimmer",
			"handlebars",
			"html",
			"javascript",
			"jsx",
			"markdown",
			"php",
			"rescript",
			"svelte",
			"tsx",
			"twig",
			"typescript",
			"vue",
			"xml",
		},
	},
}
