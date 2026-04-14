local map = vim.keymap.set
local del = vim.keymap.del

map("i", "<C-;>", "<esc>")

-- resize windows
map({ "n", "t" }, "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map({ "n", "t" }, "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map({ "n", "t" }, "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map({ "n", "t" }, "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

map({ "n", "v" }, "<S-l>", "$hl")
map({ "n", "v" }, "<S-h>", "^")
map({ "x", "s" }, "<C-w>", "d", { desc = "Delete lines" })

map("n", "<A-.>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<A-,>", "<cmd>BufferLineCyclePrev<cr>")

map({ "i", "x", "n", "s" }, "<A-w>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Line diagnostic" })

map({ "i", "n", "x", "o" }, "<A-/>", "<esc>gcc", { desc = "Toggle comment", remap = true })
map("v", "<A-/>", "gc", { desc = "Toggle comment selection", remap = true })

map({ "i", "x", "n", "s" }, "<A-c>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map({ "i", "x", "n", "s", "t" }, "<A-q>", "<cmd>qa<cr>", { desc = "Quit" })

-- Clear search with <esc>
map("n", ",<space>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Disable LazyVim terminal binds
del("n", "<leader>fT")
del("n", "<leader>ft")
del({ "n", "t" }, "<C-/>")
del({ "n", "t" }, "<C-_>")
