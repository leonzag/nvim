return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      indicator = {
        icon = "▍", -- this should be omitted if indicator style is not 'icon'
        style = "icon",
      },
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
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
        -- {
        --   filetype = "aerial",
        --   text = "Code Outline",
        --   highlight = "AerialLine",
        --   text_align = "left",
        -- }
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
    { "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to Buf 1" },
    { "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to Buf 2" },
    { "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to Buf 3" },
    { "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to Buf 4" },
    { "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to Buf 5" },
    { "<A-6>", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Go to Buf 6" },
    { "<A-7>", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Go to Buf 7" },
    { "<A-8>", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Go to Buf 8" },
    { "<A-9>", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Go to Buf 9" },
    { "<A-0>", "<cmd>BufferLineGoToBuffer 10<cr>", desc = "Go to Buf 10" },
    { "<leader>bs", "", desc = "Sort buffers" },
    { "<leader>bse", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by ext" },
    { "<leader>bsd", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by dir" },
    { "<leader>bst", "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tab" },
  },
}
