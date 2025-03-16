local colors = {
  gruvbox = {
    bg = "#282828",
    bg0 = "#232323",
    bg1 = "#3c3836",
    bg2 = "#504945",
    bg3 = "#665c54",
    bg4 = "#7c6f64",
    fg = "#ebdbb2",
  },
}

return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    init = function()
      vim.cmd.colorscheme("gruvbox")
      vim.o.background = "dark"
    end,
    -- init = function()
    --   vim.cmd([[colorscheme gruvbox]])
    --   vim.o.background = "dark"
    -- end,
    priority = 1000,
    opts = {
      inverse = false,
      -- dim_inactive = true,
      overrides = {
        NormalFloat = { bg = colors.gruvbox.bg },
        FloatBorder = { fg = colors.gruvbox.bg2, bg = colors.gruvbox.bg },
        Float = { bg = colors.gruvbox.bg0 },
        SignColumn = { bg = "none" },
        CursorLineNr = { bg = "none" },
        GruvboxYellowSign = { bg = "none" },
        GruvboxPurpleSign = { bg = "none" },
        GruvboxOrangeSign = { bg = "none" },
        GruvboxGreenSign = { bg = "none" },
        GruvboxBlueSign = { bg = "none" },
        GruvboxAquaSign = { bg = "none" },
        GruvboxRedSign = { bg = "none" },
        -- StatusLine = { fg = fg, bg = bg0 },
        TroubleNormal = { fg = colors.gruvbox.fg, bg = "none" },
        ErrorMsg = { fg = "#fb4934", bg = "none" },
      },
    },
  },
}
