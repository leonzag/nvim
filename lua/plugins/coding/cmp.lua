return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = { border = "single" },
      documentation = { window = { border = "single" } },
    },
    signature = { window = { border = "single" } },
    keymap = {
      ["<A-k>"] = { "select_prev", "show", "fallback" },
      ["<A-j>"] = { "select_next", "show", "fallback" },
      ["<A-l>"] = { "select_and_accept", "show", "fallback" },
      ["<A-h>"] = { "cancel", "show", "fallback" },

      ["<C-p>"] = { "select_prev", "show" },
      ["<C-n>"] = { "select_next", "show" },

      ["<C-h>"] = { "snippet_backward", "cancel" },
      ["<C-l>"] = { "snippet_forward", "show" },

      ["<C-k>"] = { "show_signature", "hide_signature" },
      ["<C-j>"] = { "show_signature", "hide_signature" },
    },
  },
}
