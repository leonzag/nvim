return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    win = {
      zindex = 1000,
      wo = {
        -- winblend = 10,
      },
    },
    spec = {
      {
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            -- disable expand, use Alt+[1-0] for switch buffers instead
            -- return require("which-key.extras").expand.buf()
            return {}
          end,
        },
      },
    },
  },
}
