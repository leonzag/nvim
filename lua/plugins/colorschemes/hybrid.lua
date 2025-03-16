return {
  {
    "HoNamDuong/hybrid.nvim",
    enabled = false,
    lazy = false,
    -- priority = 1000,
    init = function()
      vim.cmd.colorscheme("hybrid")
    end,
    opts = {},
  },
}
