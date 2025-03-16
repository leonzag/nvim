return {
  "gbprod/yanky.nvim",
  desc = "Better Yank/Paste",
  keys = {
    -- stylua: ignore
    {
      "<leader>p",
      function() require("telescope").extensions.yank_history.yank_history({ }) end,
      mode = { "n", "x" },
      desc = "Open Yank History",
    },
  },
}
