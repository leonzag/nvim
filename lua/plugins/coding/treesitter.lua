return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({
        pattern = {
          [".*/hypr/.*%.conf"] = "hyprlang",
          [".*%.PKGBUILD"] = "bash",
        },
      })
      -- opts.indent = { enable = false }
    end,
  },
}
