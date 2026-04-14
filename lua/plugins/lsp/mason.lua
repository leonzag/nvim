return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "shfmt",
        "bash-language-server",
      },
      ui = {
        border = "single",
        height = 0.8,
      },
    },
  },
}
