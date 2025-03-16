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
        },
        t = {
          j = {},
        },
      },
      timeout = 300,
    },
  },
  {
    "TheBlob42/houdini.nvim",
    enabled = false,
    opts = {
      mappings = { "jk", "jj", "kj" },
      escape_sequences = {
        -- ["t"] = "<BS><BS><C-\\><C-n>",
        ["t"] = "<BS><BS><C-\\><Esc>",
      },
    },
  },
}
