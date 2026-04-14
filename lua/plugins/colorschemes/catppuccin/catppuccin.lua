-- https://github.com/thanhvule0310/dotfiles
-- https://github.com/saumyajyoti/astro_user -- also wonderful gruvboxed catppuccin config

-- local theme = require("plugins.colorschemes.catppuccin.themes.gruvbox")
-- local theme = { opts = {} } -- default theme
local loader = require("plugins.colorschemes.catppuccin.themes.loader")

-- local theme = "gruvbox"
-- local theme = "default"
local theme = "ayu"

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true, -- set 'false' to sturtup
  priority = 1000,
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
  opts = loader.load_theme(theme),
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-nvim")
  end,
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        if (vim.g.colors_name or ""):find("catppuccin") then
          opts.highlights = require("catppuccin.special.bufferline").get_theme()
        end
      end,
    },
    {
      "petertriho/nvim-scrollbar",
      optional = true,
      opts = function(_, opts)
        if (vim.g.colors_name or ""):find("catppuccin") then
          local colors = require("catppuccin.palettes").get_palette()
          opts.handle = { color = colors.crust }
          opts.marks = {
            Cursor = { text = " ", color = colors.base },
            Search = { color = colors.teal },
            Error = { color = colors.red },
            Warn = { color = colors.peach },
            Info = { color = colors.green },
            Hint = { color = colors.blue },
            Misc = { color = colors.pink },
          }
        end
      end,
    },
  },
}
