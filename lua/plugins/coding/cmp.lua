return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = { border = "single" },
      documentation = {
        window = { border = "double" },
        auto_show_delay_ms = 100,
      },
    },
    signature = { window = { border = "single" } },
    keymap = {
      preset = "none",

      ["<C-e>"] = { "hide", "fallback" },
      ["<M-k>"] = { "select_prev", "show", "fallback" },
      ["<M-j>"] = { "select_next", "show", "fallback" },
      ["<M-l>"] = { "select_and_accept", "show", "fallback" },
      ["<M-h>"] = { "cancel", "show", "fallback" },

      ["<C-h>"] = { "snippet_backward", "cancel" },
      ["<C-l>"] = { "snippet_forward", "show" },

      ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

      ["<C-k>"] = false,
      ["<C-j>"] = false,
    },
  },
}
