-- local statusline = "heirline"
local statusline = "lualine"

return {
  { import = "plugins.ui.statusline." .. statusline },
}
