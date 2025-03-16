return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<A-f>",
      function()
        require("lazyvim.util").format({ force = true })
      end,
      mode = { "n", "v" },
      desc = "Format file",
    },
  },
  opts = {
    formatters_by_ft = {
      ["zsh"] = { "shfmt" },
    },
  },
}
