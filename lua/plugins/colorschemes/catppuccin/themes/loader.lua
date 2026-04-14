local M = {}

local base_opts = {
  background = {
    light = "latte",
    dark = "mocha",
  },

  transparent_background = true,
  float = {
    transparent = true,
    solid = false,
  },

  show_end_of_buffer = false,
  integration_default = false,
  default_integrations = true,
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
    lsp_trouble = true,
    blink_cmp = true,
    bufferline = false, -- NOTE: setup instead: https://www.lazyvim.org/plugins/colorscheme#catppuccin
  },
  styles = {
    loops = { "italic" },
    properties = { "italic" },
  },
}

M.load_theme = function(name)
  if not name or name == "" or name == "base" then
    return base_opts
  end

  if name == "default" then
    return M.load_default()
  end

  local path = "plugins.colorschemes.catppuccin.themes." .. name
  local ok, theme = pcall(require, path)
  if not ok then
    vim.notify("failed to load theme: " .. name)
    return base_opts
  end

  local opts = vim.tbl_extend("force", base_opts, theme.opts)
  -- local opts = theme.opts

  return opts
end

M.load_default = function()
  return {}
end

return M
