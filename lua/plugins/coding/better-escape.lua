return {
  {
    "max397574/better-escape.nvim",
    enabled = true,
    vscode = true,
    opts = {
      -- mapping = { "jk", "jj", "kj" },
      mappings = {
        i = {
          k = { j = "<Esc>" },
          ["л"] = { ["о"] = "<Esc>" },
          ["о"] = { ["л"] = "<Esc>" },
        },
        t = {
          j = {},
        },
      },
      timeout = 300,
    },
  },
}
