-- https://github.com/thanhvule0310/dotfiles
-- https://github.com/saumyajyoti/astro_user -- also wonderful gruvboxed catppuccin config

local theme = require("plugins.colorschemes.catppuccin.themes.gruvbox")
-- local theme = { opts = {} } -- default theme

return {
  "catppuccin/nvim",
  name = "catppuccin",
  -- vscode = true,
  dependencies = {
    {
      "rasulomaroff/reactive.nvim",
      enabled = false,
      opts = {
        load = {
          "catppuccin-mocha-cursor",
          "catppuccin-mocha-cursorline",
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      },
    },
  },
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin")
  end,
  opts = theme.opts,
}
