return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      tailwindcss = function(_, opts)
        opts.settings = {
          tailwindCSS = {
            files = {
              exclude = { "**/.config/waybar/**" },
            },
            includeLanguages = {
              templ = "html",
            },
          },
        }
      end,
    },
  },
}
