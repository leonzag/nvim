return {
  "folke/snacks.nvim",
  enabled = true,
  keys = {
    {
      "<A-e>",
      function()
        Snacks.explorer.open()
      end,
      mode = { "n", "v" },
      desc = "Toggle Explorer",
    },
  },
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          enter = false,
          win = {
            list = {
              keys = {
                ["_"] = "edit_split",
                ["|"] = "edit_vsplit",
                ---@diagnostic disable-next-line: assign-type-mismatch
                ["w"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
}
