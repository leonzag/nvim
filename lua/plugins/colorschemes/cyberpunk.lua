return {
  "ingenarel/cyberpunk-neon.nvim",
  lazy = true, -- set 'false' to enable sturtup
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("cyberpunk-neon")
  end,
}
