return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    italic_comments = true,
    colors = {
      dark = {
        -- fg = "#d8dce2",
        fg = "#cfd5de",
        -- fg = "#c7ced8",
      },
    },
    overrides = function(c)
      local util = require("cyberdream.util")

      local blend = util.blend
      -- local desaturate = util.desaturate_hex

      local cursorline_bg = blend(c.blue, "#000000", 0.15)

      return {
        Visual = {
          bg = blend(c.magenta, "#000000", 0.2),
          bold = true,
        },

        Operator = { fg = c.cyan, bold = true },
        Type = { fg = c.orange },
        Function = { fg = c.cyan },
        Keyword = { fg = c.purple, bold = true },
        Conditional = { fg = c.magenta, italic = true },
        Repeat = { fg = c.magenta, italic = true },
        Special = { fg = c.purple },
        Delimiter = { fg = c.grey },
        Boolean = { fg = c.orange },

        DiagnosticUnderlineHint = { underline = true, sp = c.cyan },
        DiagnosticUnderlineInfo = { underline = true, sp = c.blue },
        DiagnosticUnderlineWarn = { underline = true, sp = c.yellow },
        DiagnosticUnderlineError = { underline = true, sp = c.red },

        LspReferenceText = { underline = true },
        LspReferenceRead = {
          bg = blend(c.blue, "#000000", 0.2),
        },
        LspReferenceWrite = {
          bg = blend(c.blue, "#000000", 0.2),
        },
        MatchParen = { underline = true },

        CursorLine = { bg = cursorline_bg },
        CursorLineNr = { fg = c.purple, bold = true },

        FloatBorder = { fg = c.magenta },

        diffAdded = { link = "Added" },
        diffRemoved = { link = "Removed" },

        ["@type.builtin"] = { link = "Type" },
        ["@constant.builtin"] = { fg = c.orange },
        ["@constant.builtin.go"] = { link = "@constant.builtin" },

        ["@comment.error"] = { fg = c.bg_alt, bg = c.red },
        ["@comment.note"] = { fg = c.bg_alt, bg = c.blue },
        ["@comment.todo"] = { fg = c.bg_alt, bg = c.magenta },
        ["@comment.waring"] = { fg = c.bg_alt, bg = c.orange },
        ["@comment.waring.gitcommit"] = { fg = c.orange },

        ["@function.builtin"] = { fg = c.yellow },
        ["@field"] = { fg = c.blue },

        ["@variable"] = { link = "Variable" },
        ["@variable.member"] = { link = "@property" },
        ["@variable.parameter"] = { fg = c.blue, italic = true },
        ["@keyword.conditional"] = { link = "Conditional" },
        ["@keyword.conditional.ternary"] = { link = "Operator" },
        ["@keyword.debug"] = { link = "Exception" },
        ["@keyword.Repeat"] = { link = "Repeat" },

        ["@lsp.typemod.function.builtin"] = { link = "@function.builtin" },
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },

        ["@module"] = { fg = c.orange, bold = true, italic = true },
        ["@namespace"] = { fg = c.orange, italic = true },
        ["@property"] = { fg = c.blue, italic = true },
        ["@property.class.css"] = { fg = c.orange },
        ["@property.css"] = { fg = c.blue },
        ["@property.id.css"] = { fg = c.orange },
        ["@property.scss"] = { fg = c.blue },
        ["@punctiation.delimiter.regex"] = { link = "@string.regexp" },
        ["@punctiation.special"] = { link = "Special" },

        ["@string.documentation"] = { fg = c.cyan },
        ["@string.special.url"] = { fg = c.blue, italic = true, underline = true },
        ["@string.special.url.html"] = { fg = c.green, italic = true },

        ["@tag.attribute"] = { fg = c.orange, italic = true },
        ["@tag.delimiter"] = { fg = c.cyan },

        ["@text.diff.add"] = { link = "diffAdded" },
        ["@text.diff.delete"] = { link = "diffRemoved" },
        ["@text.emphasis"] = { link = "Delimiter" },

        AerialArrayIcon = { link = "@constant" },
        AerialBooleanIcon = { link = "@boolean" },
        AerialClassIcon = { link = "@type" },
        AerialConstantIcon = { link = "@constant" },
        AerialConstructorIcon = { link = "@constructor" },
        AerialEnumIcon = { link = "@type" },
        AerialEnumMemberIcon = { link = "@field" },
        AerialEventIcon = { link = "@type" },
        AerialFieldIcon = { link = "@field" },
        AerialFileIcon = { link = "@text.uri" },
        AerialFunctionIcon = { link = "@function" },
        AerialGuide = { link = "Delimiter" },
        AerialInterfaceIcon = { link = "@type" },
        AerialKeyIcon = { link = "@type" },
        AerialLine = { fg = c.orange },
        AerialMethodIcon = { link = "@method" },
        AerialModuleIcon = { link = "@namespace" },
        AerialNamespaceIcon = { link = "@namespace" },
        AerialNullIcon = { link = "@type" },
        AerialNumberIcon = { link = "@number" },
        AerialObjectIcon = { link = "@type" },
        AerialOperatorIcon = { link = "@operator" },
        AerialPackageIcon = { link = "@namespace" },
        AerialPropertyIcon = { link = "@property" },
        AerialStringIcon = { link = "@string" },
        AerialStructIcon = { link = "@type" },
        AerialTypeParameterIcon = { link = "@type" },
        AerialVariableIcon = { link = "@constant" },

        BlinkCmpKind = { fg = c.blue },

        CmpItemKind = { fg = c.blue },
        CmpItemKindClass = { fg = c.yellow },
        CmpItemKindColor = { fg = c.red },
        CmpItemKindConstant = { fg = c.orange },
        CmpItemKindConstuctor = { fg = c.blue },
        CmpItemKindCopilot = { fg = c.purple },
        CmpItemKindEnum = { fg = c.green },
        CmpItemKindEnumMember = { fg = c.pink },
        CmpItemKindEvent = { fg = c.cyan },
        CmpItemKindField = { fg = c.green },
        CmpItemKindFile = { fg = c.cyan },
        CmpItemKindFolder = { fg = c.cyan },
        CmpItemKindFunction = { fg = c.blue },
        CmpItemKindInterface = { fg = c.orange },
        CmpItemKindKeyword = { fg = c.magenta },
        CmpItemKindMethod = { fg = c.blue },
        CmpItemKindModule = { fg = c.blue },
        CmpItemKindOperator = { fg = c.blue },
        CmpItemKindProperty = { fg = c.green },
        CmpItemKindReference = { fg = c.red },
        CmpItemKindSnipper = { fg = c.pink },
        CmpItemKindStruct = { fg = c.blue },
        CmpItemKindTypeParameter = { fg = c.blue },
        CmpItemKindUnit = { fg = c.green },
        CmpItemKindValue = { fg = c.orange },
      }
    end,
  },
  config = function(_, opts)
    require("cyberdream").setup(opts)
    vim.cmd.colorscheme("cyberdream")
  end,
}
