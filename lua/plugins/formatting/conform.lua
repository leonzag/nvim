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
      ["htmldjango"] = { "djlint" },
      ["c"] = { "clang_format" },
      ["xml"] = { "xmlformatter" },
    },
    formatters = {
      clang_format = {
        prepend_args = {
          "--style=file",
          "--fallback-style=LLVM",
        },
      },
      shfmt = {
        prepend_args = { "-i", "4" },
      },
    },
  },
}
