return {
  "neovim/nvim-lspconfig",
  setup = {
    tailwindcss = function(_, opts)
      opts.settings.includeLanguages["templ"] = "html"
    end,
  },
}
