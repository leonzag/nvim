return {
  {
    "RaafatTurki/corn.nvim",
    enabled = false, -- WARN: memory leak
    event = "LspAttach",
    keys = {
      { "ge", "<cmd>Corn scope_cycle<cr>", desc = "Toggle diagnostics scope" },
      { "<leader>cD", "<cmd>Corn toggle<cr>", desc = "Toggle corn diagnostics" },
    },
    opts = {
      blacklisted_modes = { "i", "v", "V" },
      border_style = "single",
      icons = {
        error = " ",
        warn = " ",
        hint = "󰠠 ",
        info = " ",
      },
      -- set item_preprocess_func to return the item unmodified
      ---@param item Corn.Item
      ---@return Corn.Item
      item_preprocess_func = function(item)
        -- vim.notify(item.message)
        return item
      end,
    },
  },
}
