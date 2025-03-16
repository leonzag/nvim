return {
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      local scrollbar = require("scrollbar")
      -- local colors = require("tokyonight.colors").setup()
      local colors = require("catppuccin.palettes").get_palette()
      scrollbar.setup({
        hide_if_all_visible = true, -- Hides everything if all lines are visible
        throttle_ms = 50,
        handle = { color = colors.crust },
        excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
        marks = {
          Cursor = { text = " ", color = colors.base },
          Search = { color = colors.teal },
          Error = { color = colors.red },
          Warn = { color = colors.peach },
          Info = { color = colors.green },
          Hint = { color = colors.blue },
          Misc = { color = colors.pink },
        },
      })
    end,
  },
}
