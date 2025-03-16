return {
  "ThePrimeagen/refactoring.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "Refactor" },
  keys = {
    {
      "<leader>cr",
      function()
        ---@diagnostic disable-next-line
        require("refactoring").select_refactor()
      end,
      mode = "v",
      noremap = true,
      silent = true,
      expr = false,
      desc = "Refactor",
    },
  },
  opts = {},
}
