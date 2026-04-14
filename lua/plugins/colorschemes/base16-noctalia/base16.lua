local matugen = "plugins.colorschemes.base16-noctalia.noctalia.colors"

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded[matugen] = nil
    require(matugen).setup()
  end)
)


return {
  "RRethy/base16-nvim",
  lazy = true, -- set 'false' to sturtup
  priority = 1000,
  -- enabled = false,
  config = function()
    require(matugen).setup()
  end,
}
