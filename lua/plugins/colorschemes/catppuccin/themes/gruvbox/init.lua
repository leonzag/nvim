M = {}

local color_overrides = require("plugins.colorschemes.catppuccin.themes.gruvbox.color_overrides")
local highlight_overrides = require("plugins.colorschemes.catppuccin.themes.gruvbox.highlight_overrides")

M.opts = {
  background = {
    light = "latte",
    dark = "mocha",
  },

  color_overrides = color_overrides,
  highlight_overrides = highlight_overrides,

  transparent_background = false,
  show_end_of_buffer = false,
  integration_default = false,
  integrations = {
    barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
    cmp = true,
    gitsigns = true,
    hop = true,
    illuminate = true,
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
      inlay_hints = { background = true },
    },
    neogit = true,
    neotree = true,
    semantic_tokens = true,
    treesitter = true,
    treesitter_context = true,
    vimwiki = true,
    which_key = true,
    indent_blankline = {
      enabled = true,
      scope_color = "peach",
      colored_indent_levels = false,
    },
    snacks = {
      enabled = true,
      indent_scope_color = "peach",
    },
  },
  styles = {
    loops = { "italic" },
    properties = { "italic" },
  },
}

return M
