---@type vim.lsp.Config
return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
  root_markers = { ".git" },
  settings = {
    bashIde = {
      globPattern = "**/*@(.sh|.bash|.zsh|.inc|.command)",
    },
  },
}
