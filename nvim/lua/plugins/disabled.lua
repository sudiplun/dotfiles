return {
  { "folke/flash.nvim", enabled = false },
  -- { "akinsho/bufferline.nvim", enabled = false },
  -- disable cmdline
  {
    "folke/noice.nvim",
    opts = {
      cmdline = { enabled = false },
      messages = { enabled = false },
    },
  },
}
