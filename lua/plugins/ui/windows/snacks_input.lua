return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    ---@type table<string, snacks.win.Config>
    styles = {
      input = {
        border = "single",
        relative = "cursor",
        row = -3,
        col = 0,
      },
      notification = {
        border = "single",
        relative = "editor",
      },
    },
  },
}
