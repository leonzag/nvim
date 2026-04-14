return {
  "Zeioth/neon.nvim",
  lazy = true, -- set 'false' to enable sturtup
  priority = 1000,
  opts = {
    transparent = true,
    terminal_colors = true,
    dim_inactive = false,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  config = function(_, opts)
    require("neon").setup(opts)

    local variant = "night"
    -- local variant = "storm"

    -- local type = "cherrykiss"
    -- local type = "cyberpunk"
    local type = "netrunner"
    -- local type = "punkpeach"

    local theme = string.format("neon-%s-%s", type, variant)
    vim.cmd.colorscheme(theme)
  end,
}
