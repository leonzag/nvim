return {
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    opts = {
      hide_if_all_visible = true, -- Hides everything if all lines are visible
      throttle_ms = 50,
      excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
    },
  },
}
