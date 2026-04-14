return {
  "projekt0n/github-nvim-theme",
  name = "github-nvim",
  lazy = true,
  priority = 1000,
  config = function ()
    vim.cmd.colorscheme("github_dark_tritanopia")
  end
}
