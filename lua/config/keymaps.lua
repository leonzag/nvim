local map = vim.keymap.set
local del = vim.keymap.del

map("i", "<C-;>", "<esc>")

-- resize windows
map({ "n", "t" }, "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map({ "n", "t" }, "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map({ "n", "t" }, "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map({ "n", "t" }, "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

map({ "n", "v" }, "<S-l>", "$hl")
map({ "n", "v" }, "<S-h>", "^")
map({ "x", "s" }, "<C-w>", "d", { desc = "Delete lines" })

map({ "i", "x", "n", "s" }, "<M-w>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Line diagnostic" })

map({ "i", "n", "x", "o" }, "<M-/>", "<esc>gcc", { desc = "Toggle comment", remap = true })
map("v", "<M-/>", "gc", { desc = "Toggle comment selection", remap = true })

map({ "i", "x", "n", "s" }, "<M-c>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map({ "i", "x", "n", "s", "t" }, "<M-q>", "<cmd>qa<cr>", { desc = "Quit" })

-- To normal mode
map("i", "<C-j>", "<esc>")
map("i", "<C-k>", "<esc>")
map("i", "<C-х>", "<esc>") -- x - is russian хэ
-- Clear search with <esc>
map("", ",<space>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Disable LazyVim terminal binds
del("n", "<leader>fT")
del("n", "<leader>ft")
del({ "n", "t" }, "<C-/>")
del({ "n", "t" }, "<C-_>")
