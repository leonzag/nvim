return {
  { "nvim-lualine/lualine.nvim", enabled = false },
  {
    "rebelot/heirline.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "neovim/nvim-lspconfig",
      {
        "catppuccin/nvim",
        name = "catppuccin",
      }, -- depends on colorset
    },
    config = require("plugins.ui.statusline.configs.heirline"),
  },
}
