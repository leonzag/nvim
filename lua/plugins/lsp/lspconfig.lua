return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      {
        "<leader>r",
        function()
          vim.notify("Restart LSP Server")
          vim.cmd([[LspRestart]])
        end,
        mode = "n",
        desc = "Restart LSP",
      },
      { "<A-r>", vim.lsp.buf.rename, mode = "n", desc = "Rename" },
    },
    opts = {
      diagnostics = {
        -- signs = true,
        virtual_text = false,
        float = {
          show_header = false,
          -- header = { "Diagnostics", "DiagnosticInfo" },
          header = {},
          border = "single",
          source = "always",
        },
      },
      inlay_hints = {
        enabled = false,
      },
      codelens = {
        enabled = true,
      },
      document_highlight = {
        enabled = true,
      },
      servers = {
        bashls = {
          filetypes = { "sh", "bash", "zsh" },
        },
      },
    },
  },
}
