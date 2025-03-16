-- https://github.com/thanhvule0310/dotfiles

return function()
  local conditions = require("heirline.conditions")
  local utils = require("heirline.utils")
  -- local colors = require("catppuccin.palettes").get_palette()

  local function setup_colors()
    return require("catppuccin.palettes").get_palette()
  end
  require("heirline").load_colors(setup_colors)
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("Heirline", { clear = true }),
    callback = function()
      utils.on_colorscheme(setup_colors)
    end,
  })

  conditions.buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end

  conditions.hide_in_width = function(size)
    return vim.api.nvim_get_option_value("columns", { scope = "local" }) > (size or 140)
  end

  local Align = { provider = "%=", hl = { bg = "crust" } }
  local Space = { provider = " " }
  local SlopeDarkR = {
    provider = "",
    hl = { bg = "crust", fg = "mantle" },
  }
  local SlopeLightR = {
    provider = "",
    hl = { bg = "mantle", fg = "crust" },
  }
  local SlopeDarkL = {
    provider = "",
    hl = { bg = "crust", fg = "mantle" },
  }
  local SlopeLightL = {
    provider = "",
    hl = { bg = "mantle", fg = "crust" },
  }
  local SpacerDark = {
    provider = " ",
    hl = { bg = "crust", fg = "crust" },
  }
  local SpacerLight = {
    provider = " ",
    hl = { bg = "mantle", fg = "mantle" },
  }

  local ViMode = {
    {
      init = function(self)
        self.mode = vim.api.nvim_get_mode().mode
        if not self.once then
          vim.api.nvim_create_autocmd("ModeChanged", {
            pattern = "*:*o",
            command = "redrawstatus",
          })
          self.once = true
        end
      end,
      static = {
        MODE_NAMES = {
          ["n"] = "N",
          ["no"] = "N?",
          ["nov"] = "N?",
          ["noV"] = "N?",
          ["no\22"] = "N?",
          ["niI"] = "Ni",
          ["niR"] = "Nr",
          ["niV"] = "Nv",
          ["nt"] = "Nt",
          ["v"] = "V",
          ["vs"] = "Vs",
          ["V"] = "V_",
          ["Vs"] = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          ["s"] = "S",
          ["S"] = "S_",
          ["\19"] = "^S",
          ["i"] = "I",
          ["ic"] = "Ic",
          ["ix"] = "Ix",
          ["R"] = "R",
          ["Rc"] = "Rc",
          ["Rx"] = "Rx",
          ["Rv"] = "Rv",
          ["Rvc"] = "Rv",
          ["Rvx"] = "Rv",
          ["c"] = "C",
          ["cv"] = "Ex",
          ["r"] = "...",
          ["rm"] = "M",
          ["r?"] = "?",
          ["!"] = "!",
          ["t"] = "T",
        },
        MODE_COLORS = {
          [""] = "yellow",
          [""] = "yellow",
          ["s"] = "yellow",
          ["!"] = "maroon",
          ["R"] = "flamingo",
          ["Rc"] = "flamingo",
          ["Rv"] = "rosewater",
          ["Rx"] = "flamingo",
          ["S"] = "teal",
          ["V"] = "lavender",
          ["Vs"] = "lavender",
          ["c"] = "peach",
          ["ce"] = "peach",
          ["cv"] = "peach",
          ["i"] = "green",
          ["ic"] = "green",
          ["ix"] = "green",
          ["n"] = "blue",
          ["niI"] = "blue",
          ["niR"] = "blue",
          ["niV"] = "blue",
          ["no"] = "pink",
          ["no"] = "pink",
          ["noV"] = "pink",
          ["nov"] = "pink",
          ["nt"] = "red",
          ["null"] = "pink",
          ["r"] = "teal",
          ["r?"] = "maroon",
          ["rm"] = "sky",
          ["s"] = "teal",
          ["t"] = "red",
          ["v"] = "mauve",
          ["vs"] = "mauve",
        },
      },

      provider = function(self)
        local mode = self.mode:sub(1, 1)
        return string.format("▌ %s ", self.MODE_NAMES[mode])
      end,
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = self.MODE_COLORS[mode], bg = "mantle", bold = true }
      end,
      update = {
        "ModeChanged",
      },
    },
    -- {
    --   provider = "",
    --   hl = { bg = "crust", fg = "mantle" },
    -- },
  }

  local FileNameBlock = {
    init = function(self)
      if conditions.buffer_matches({ buftype = { "terminal" } }) then
        self.filename = " "
      elseif conditions.buffer_matches({ buftype = { "nofile" } }) then
        self.filename = " "
      else
        self.filename = vim.api.nvim_buf_get_name(0)
      end
    end,
    condition = conditions.buffer_not_empty,
    hl = { bg = "crust", fg = "subtext1" },
  }

  local FileIcon = {
    init = function(self)
      local filename = self.filename
      local extension = vim.fn.fnamemodify(filename, ":e")
      self.icon, self.icon_color =
        require("nvim-web-devicons").get_icon_color(vim.fn.fnamemodify(filename, ":t"), extension, { default = true })
    end,
    provider = function(self)
      return self.icon and (" %s "):format(self.icon)
    end,
    hl = function(self)
      return { fg = self.icon_color }
    end,
  }

  local FileName = {
    provider = function(self)
      local filename = vim.fn.fnamemodify(self.filename, ":t")
      if filename == "" then
        return "[No Name]"
      elseif filename == " " then
        return ""
      end
      if not conditions.width_percent_below(#filename, 0.25) then
        filename = vim.fn.pathshorten(filename)
      end
      return filename
    end,
    hl = { fg = "subtext1", bold = true },
  }

  local FileFlags = {
    {
      condition = function()
        return vim.bo.modified
      end,
      provider = " ● ",
      hl = { fg = "peach" },
    },
    {
      condition = function()
        return not vim.bo.modifiable or vim.bo.readonly
      end,
      provider = "",
      hl = { fg = "red" },
    },
  }

  local FileNameModifer = {
    hl = function()
      if vim.bo.modified then
        return { fg = "text", bold = true, force = true }
      end
    end,
  }

  FileNameBlock = utils.insert(
    FileNameBlock,
    FileIcon,
    utils.insert(FileNameModifer, FileName),
    unpack(FileFlags),
    { provider = "%< " }
  )

  local FileType = {
    provider = function()
      return (" %s "):format(vim.bo.filetype)
    end,
    hl = { bg = "crust", fg = "overlay0" },
    condition = function()
      return conditions.buffer_not_empty() and conditions.hide_in_width()
    end,
  }

  local FileSize = {
    provider = function()
      local suffix = { "b", "k", "M", "G", "T", "P", "E" }
      local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
      fsize = (fsize < 0 and 0) or fsize
      if fsize < 1024 then
        return string.format(" %s ", fsize .. suffix[1])
      end

      local i = 0
      if fsize ~= nil then
        i = math.floor((math.log(fsize) / math.log(1024)))
      end

      return string.format(" %.2g%s ", fsize / math.pow(1024, i), suffix[i + 1])
    end,
    hl = { bg = "crust", fg = "overlay0" },
    condition = function()
      return conditions.buffer_not_empty() and conditions.hide_in_width()
    end,
  }

  local LSPActive = {
    condition = function()
      return conditions.hide_in_width(120) and conditions.lsp_attached()
    end,
    update = { "LspAttach", "LspDetach" },
    on_click = {
      callback = function()
        vim.defer_fn(function()
          vim.cmd("LspInfo")
        end, 100)
      end,
      name = "heirline_LSP",
    },
    provider = function()
      local names = {}
      for _, server in pairs(vim.lsp.get_active_clients()) do
        table.insert(names, server.name)
      end

      if #names == 0 then
        return ""
      end

      return ("  %s "):format(table.concat(names, " "))
    end,
    hl = { bg = "crust", fg = "overlay2", bold = true, italic = false },
  }

  local Linters = {
    provider = function()
      local linters = require("lint")._resolve_linter_by_ft(vim.bo.filetype)

      if #linters == 0 then
        return ""
      end

      return ("  %s "):format(table.concat(linters, " "))
    end,
    hl = { bg = "crust", fg = "overlay0" },
    condition = function()
      return conditions.buffer_not_empty() and conditions.hide_in_width()
    end,
  }

  local Formatters = {
    provider = function()
      local formatters = {}
      for _, formatter in pairs(require("conform").list_formatters()) do
        if formatter.available then
          table.insert(formatters, formatter.name)
        end
      end

      if #formatters == 0 then
        return ""
      end

      return ("  %s "):format(table.concat(formatters, " "))
    end,
    on_click = {
      callback = function()
        vim.defer_fn(function() end, 100)
      end,
      name = "heirline_Formatters",
    },
    hl = { bg = "crust", fg = "overlay0" },
    condition = function()
      return conditions.buffer_not_empty() and conditions.hide_in_width()
    end,
  }

  local Diagnostics = {
    condition = function()
      return conditions.buffer_not_empty() and conditions.hide_in_width() and conditions.has_diagnostics()
    end,
    static = {
      -- error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
      -- warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
      -- info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
      -- hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
      error_icon = require("lazyvim.config").icons.diagnostics.Error,
      warn_icon = require("lazyvim.config").icons.diagnostics.Warn,
      info_icon = require("lazyvim.config").icons.diagnostics.Info,
      hint_icon = require("lazyvim.config").icons.diagnostics.Hint,
    },
    init = function(self)
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,
    on_click = {
      callback = function()
        require("trouble").toggle({ mode = "document_diagnostics" })
        -- or
        -- vim.diagnostic.setqflist()
      end,
      name = "heirline_diagnostics",
    },
    update = { "DiagnosticChanged", "BufEnter" },
    hl = { bg = "crust" },
    Space,
    {
      provider = function(self)
        return self.errors > 0 and ("%s%s "):format(self.error_icon, self.errors)
      end,
      hl = { fg = "red" },
    },
    {
      provider = function(self)
        return self.warnings > 0 and ("%s%s "):format(self.warn_icon, self.warnings)
      end,
      hl = { fg = "yellow" },
    },
    {
      provider = function(self)
        return self.info > 0 and ("%s%s "):format(self.info_icon, self.info)
      end,
      hl = { fg = "sapphire" },
    },
    {
      provider = function(self)
        return self.hints > 0 and ("%s%s "):format(self.hint_icon, self.hints)
      end,
      hl = { fg = "sky" },
    },
    Space,
  }

  local Git = {
    condition = conditions.is_git_repo,
    init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
      self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,
    hl = { bg = "mantle" },
    -- {
    --   provider = "",
    --   hl = { bg = "crust", fg = "mantle" },
    -- },
    {
      provider = function(self)
        return ("  %s"):format(self.status_dict.head == "" and "~" or self.status_dict.head)
      end,
      hl = { fg = "mauve" },
    },
    {
      provider = function(self)
        local count = self.status_dict.added or 0
        return count > 0 and ("  %s"):format(count)
      end,
      hl = { fg = "green" },
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width()
      end,
    },
    {
      provider = function(self)
        local count = self.status_dict.removed or 0
        return count > 0 and ("  %s"):format(count)
      end,
      hl = { fg = "red" },
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width()
      end,
    },
    {
      provider = function(self)
        local count = self.status_dict.changed or 0
        return count > 0 and ("  %s"):format(count)
      end,
      hl = { fg = "peach" },
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width()
      end,
    },
    Space,
    -- {
    --   provider = "",
    --   hl = { bg = "mantle", fg = "crust" },
    -- },
  }

  local FileFormat = {
    provider = function()
      local fmt = vim.bo.fileformat
      if fmt == "unix" then
        return " lf "
      elseif fmt == "mac" then
        return " cr "
      else
        return " crlf "
      end
    end,
    hl = { bg = "crust", fg = "overlay0" },
    condition = function()
      return conditions.buffer_not_empty() and conditions.hide_in_width()
    end,
  }

  local FileEncoding = {
    provider = function()
      local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
      return (" %s "):format(enc:lower())
    end,
    condition = function()
      return conditions.buffer_not_empty() and conditions.hide_in_width()
    end,
    hl = { bg = "crust", fg = "overlay0" },
  }

  local IndentSizes = {
    provider = function()
      local indent_type = vim.api.nvim_get_option_value("expandtab", { scope = "local" }) and "sp" or "tab"
      local indent_size = vim.api.nvim_get_option_value("tabstop", { scope = "local" })

      return (" %s: %s "):format(indent_type, indent_size)
    end,
    hl = {
      bg = "crust",
      fg = "overlay0",
    },
    condition = function()
      return conditions.buffer_not_empty() and conditions.hide_in_width()
    end,
  }
  local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%5(%l:%c%)",
    hl = {
      bg = "crust",
      fg = "overlay0",
    },
  }
  local Lazy = {
    condition = require("lazy.status").has_updates,
    update = { "User", pattern = "LazyUpdate" },
    provider = function()
      return "  " .. require("lazy.status").updates() .. " "
    end,
    on_click = {
      callback = function()
        require("lazy").update()
      end,
      name = "update_plugins",
    },
    hl = { fg = "overlay0" },
  }

  local Clock = {
    {
      provider = function()
        return "   " .. os.date("%R") .. " "
      end,
      hl = { fg = "lavender", bg = "mantle" },
    },
  }

  require("heirline").setup({
    statusline = {
      ViMode,
      Git,
      SlopeLightL,
      FileNameBlock,
      -- FileSize,
      Align,
      LSPActive,
      Linters,
      -- Formatters,
      Diagnostics,
      Lazy,
      FileType,
      FileFormat,
      FileEncoding,
      IndentSizes,
      SpacerDark,
      Ruler,
      SpacerDark,
      SlopeLightR,
      Clock,
    },
  })
end
