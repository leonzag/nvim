local lsp_clients_count = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ buf = bufnr })

  return next(clients) == nil and 0 or #clients
end

local function lint_count()
  local lints = require("lint")._resolve_linter_by_ft(vim.bo.filetype)

  return lints == nil and 0 or #lints
end

local function fmt_count()
  local fmt = require("conform").list_formatters_for_buffer()
  if fmt and #fmt > 0 then
    return #fmt
  end
  -- Check if there's an LSP formatter
  local lsp_format = require("conform.lsp_format")
  local bufnr = vim.api.nvim_get_current_buf()
  local lsp_fmt = lsp_format.get_format_clients({ bufnr = bufnr })

  return not vim.tbl_isempty(lsp_fmt) and 1 or 0
end

local lsp_indicator = {
  lsp_clients_count,
  icon = " ",
  cond = function()
    return lsp_clients_count() > 0
  end,
  color = function()
    return { fg = Snacks.util.color("Character") }
  end,
}

local lint_indicator = {
  lint_count,
  icon = " ",
  cond = function()
    -- buffer not empty
    local buf_not_empty = vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    return buf_not_empty and lint_count() > 0
  end,
  color = function()
    return { fg = Snacks.util.color("Boolean") }
  end,
}

local fmt_indicator = {
  fmt_count,
  icon = "󰷈",
  cond = function()
    return fmt_count() > 0
  end,
  color = function()
    return { fg = Snacks.util.color("Comment") }
  end,
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local options = opts.options
      local lualine_c = opts.sections.lualine_c
      local lualine_b = opts.sections.lualine_b
      local lualine_x = opts.sections.lualine_x

      options.component_separators = {
        left = "|",
        right = "|",
      }
      options.section_separators = {
        left = "",
        right = "",
      }

      -- change pretty_path() style
      local path_opts = {
        relative = "cwd",
        modified_hl = "BufferLineModified",
        directory_hl = "",
        filename_hl = "Bold",
        modified_sign = " ⬤ ",
        readonly_icon = " 󰌾 ",
        length = 3,
      }
      table.remove(lualine_c, 4)
      table.insert(lualine_c, 4, LazyVim.lualine.pretty_path(path_opts))

      -- move git_diff from 'x' to 'b' section
      table.insert(lualine_b, table.remove(lualine_x, #lualine_x))

      -- remove key-pressed-status
      table.remove(lualine_x, 2)

      -- add encoding indicator
      table.insert(lualine_x, {
        "encoding",
        color = function()
          return { fg = Snacks.util.color("Comment"), gui = "italic" }
        end,
      })

      -- LSP, Linter, Formatter indicators
      table.insert(lualine_x, #lualine_x, lsp_indicator)
      table.insert(lualine_x, #lualine_x, lint_indicator)
      table.insert(lualine_x, #lualine_x, fmt_indicator)

      return opts
    end,
  },
}
