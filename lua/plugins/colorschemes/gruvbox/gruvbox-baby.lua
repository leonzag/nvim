return {
  {
    "luisiacc/gruvbox-baby",
    lazy = true,
    priority = 1000,
    -- dependencies = {
    --   {
    --     "rasulomaroff/reactive.nvim",
    --     config =
    --   },
    -- },
    init = function()
      vim.cmd.colorscheme("gruvbox-material")
      local c = require("gruvbox-baby.colors").config()
      vim.g.gruvbox_baby_telescope_theme = 1
      -- vim.g.gruvbox_baby_use_original_palette = true  -- default: false
      vim.g.gruvbox_baby_highlights = {
        FloatBorder = { fg = c.background_light, bg = c.none },
        -- DiagnosticFloatingError = { fg = c.error_red, bg = c.none },
        -- DiagnosticFloatingWarn = { fg = c.orange, bg = c.none },
        -- DiagnosticFloatingInfo = { fg = c.light_blue, bg = c.none },
        -- DiagnosticFloatingHint = { fg = c.dark_gray, bg = c.none },
        -- NoiceFloat = { fg = c.background_light, bg = c.none },
        -- NoicePopupBorder = { fg = c.background_light, bg = c.none },
        PmenuThumb = { bg = c.medium_gray },
        -- NormalFloat = { link = "Normal" },
        TelescopeBorder = { fg = c.background_light, bg = c.background_dark },
        TelescopePromptBorder = { fg = c.background, bg = c.background_light },
        TelescopePromptNormal = { fg = c.foreground, bg = c.background_light },
        TelescopePromptPrefix = { fg = c.soft_yellow, bg = c.background_light },
        TelescopePromptCounter = { link = "TelescopePromptNormal" },
      }
    end,
  },
}
