local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "html", --blade file
	},
	extension = {
		njk = "html",
	},
})
