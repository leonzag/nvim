return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      indicator = {
        -- icon = "▐", -- this should be omitted if indicator style is not 'icon'
        style = "none",
      },
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
      persist_buffer_sort = true,
      buffer_close_icon = "✖",
      sort_by = "directory",
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "NeoTreeDirectoryIcon",
          text_align = "center",
        },
        {
          filetype = "snacks_layout_box",
        },
      },
    },
  },
  keys = {
    { "<A-.>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<A-]>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right " },
    { "<A-,>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<A-[>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
    { "<S-h>", false },
    { "<S-l>", false },
    { "<leader>bs", "", desc = "Sort buffers" },
    { "<leader>bse", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by ext" },
    { "<leader>bsd", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by dir" },
    { "<leader>bst", "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tab" },
  },
}
