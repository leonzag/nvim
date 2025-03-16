local function docgen()
  require("neogen").generate({})
end

return {
  "danymat/neogen",
  keys = {
    { "<leader>ch", docgen, desc = "Neogen Comment" },
    { "gch", docgen, desc = "Neogen Comment" },
  },
  opts = {
    -- snippet_engine = "luasnip",
    snippet_engine = "nvim",
    languages = {
      lua = { template = { annotation_convention = "ldoc" } },
      typescript = { template = { annotation_convention = "tsdoc" } },
      typescriptreact = { template = { annotation_convention = "tsdoc" } },
    },
  },
}
