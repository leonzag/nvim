local toggle_comment_n = function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end
local toggle_comment_v = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>"

return {
  {
    "folke/ts-comments.nvim",
    opts = {
      lang = {
        hyprlang = "# %s",
      },
    },
  },
  {
    "echasnovski/mini.comment",
    enabled = false,
    vscode = false,
  },
  {
    "numToStr/Comment.nvim",
    enabled = true,
    lazy = false,
    event = "LazyFile",
    vscode = true,
    init = function()
      local ft = require("Comment.ft")
      ft.set("hyprlang", "# %s")
    end,
    opts = {
      -- local ft = require("Comment.ft"),
      -- ft.set("hyprlang", "#%s"),
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        -- line = "gcc",
        block = "gbc",
      },
      opleader = {
        -- line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      mappings = {
        basic = false,
        extra = true,
      },
      pre_hook = function()
        require("ts-comments.comments")
      end,
    },
    -- opts = function(opts)
    --   -- local ft = require("Comment.ft")
    --   -- ft.set("hyprlang", "#%s")
    --   opts["padding"] = true
    --   opts["sticky"] = true
    --   opts["ignore"] = nil
    --   opts["toggler"] = {
    --     -- line = "gcc",
    --     block = "gbc",
    --   }
    --   opts["opleader"] = {
    --     -- line = "gc",
    --     block = "gb",
    --   }
    --   opts["extra"] = {
    --     above = "gcO",
    --     below = "gco",
    --     eol = "gcA",
    --   }
    --   opts["mappings"] = {
    --     basic = false,
    --     extra = true,
    --   }
    --   opts["pre_hook"] = function()
    --     require("ts-comments.comments")
    --     require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    --   end
    --   opts["post_hook"] = nil
    -- end,
    -- keys = {
    --   { "<A-/>", toggle_comment_n, mode = { "i", "n" }, desc = "Toggle comment line" },
    --   { "<C-/>", toggle_comment_n, mode = { "i", "n" }, desc = "Toggle comment line" },
    --   { "<A-/>", toggle_comment_v, mode = "v", desc = "Toggle comment for selection" },
    --   { "<C-/>", toggle_comment_v, mode = "v", desc = "Toggle comment for selection" },
    -- },
  },
}
