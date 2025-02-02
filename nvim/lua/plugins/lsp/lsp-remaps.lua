return {
	-- call by require at lsp.lua on config
	setup = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- -- fzf-lua LSP mappings
				-- local fzf = require("fzf-lua")
				-- map("gd", fzf.lsp_definitions, "[G]oto [D]efinition")
				-- map("gr", fzf.lsp_references, "[G]oto [R]eferences")
				-- map("gI", fzf.lsp_implementations, "[G]oto [I]mplementation")
				-- map("<leader>D", fzf.lsp_typedefs, "Type [D]efinition")
				-- map("<leader>ds", fzf.lsp_document_symbols, "[D]ocument [S]ymbols")
				-- map("<leader>ws", fzf.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
				--
				-- Standard LSP mappings
				map("K", vim.lsp.buf.hover, "Hover Document")
				map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				-- Client-specific features
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				-- Document highlight
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- Inlay hints toggle
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})
	end,
}
