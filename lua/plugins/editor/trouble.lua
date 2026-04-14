return {
  "folke/trouble.nvim",
  opts = {
    warn_no_results = false,
  },
  keys = {
    { "<A-x>", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<A-i>", "<cmd>Trouble lsp toggle<cr>", desc = "Lsp (Trouble)" },
    { "<A-s>", "<cmd>Trouble symbols toggle<cr>", desc = "LspSymbols (Trouble)" },
  },
}
