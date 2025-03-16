local map = vim.keymap.set

-- Configure `langmap`
local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
  -- | `to` should be first     | `from` should be second
  escape(ru_shift)
    .. ";"
    .. escape(en_shift),
  escape(ru) .. ";" .. escape(en),
}, ",")

-- resize windows
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

-- map({"i", "n", "x"}, "<A-e>", rhs, opts)
map({ "n", "v" }, "<S-l>", "$hl")
map({ "n", "v" }, "<S-h>", "^")
map({ "x", "s" }, "<C-w>", "d", { desc = "Delete lines" })

map("n", "<A-.>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<A-,>", "<cmd>BufferLineCyclePrev<cr>")

-- map({ "i", "x", "n", "s" }, "<A-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "i", "x", "n", "s" }, "<A-w>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Line diagnostic" })

map({ "i", "n", "x", "o" }, "<A-/>", "<esc>gcc", { desc = "Toggle comment", remap = true })
map({ "i", "n", "x", "o" }, "<C-/>", "<esc>gcc", { desc = "Toggle comment", remap = true })
map("v", "<A-/>", "gc", { desc = "Toggle comment selection", remap = true })
map("v", "<C-/>", "gc", { desc = "Toggle comment selection", remap = true })

map({ "i", "x", "n", "s" }, "<A-c>", function () Snacks.bufdelete() end, { desc = "Delete Buffer" })
map({ "i", "x", "n", "s" }, "<A-q>", "<cmd>qa<cr>", { desc = "Quit" })

-- Clear search with <esc>
map("n", ",<space>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- RUSSIAN
map({ "i", "x", "n", "s" }, "<C-ц>", "<C-w>")
map({ "n", "v" }, "<S-д>", "<S-l>")
map({ "n", "v" }, "<S-р>", "<S-h>")
map("n", "<A-б>", "<A-.>")
map("n", "<A-ю>", "<A-,>")
map({ "i", "x", "n", "s" }, "<A-й>", "<A-q>")
map({ "i", "x", "n", "s" }, "<A-ч>", "<A-x>")
map({ "i", "x", "n", "s" }, "<A-с>", "<A-c>")
