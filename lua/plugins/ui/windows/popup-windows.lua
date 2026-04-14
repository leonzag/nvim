local function close_on_leave(popup_id)
  -- This autocmd will close the created detour popup when you focus on a different window.
  vim.api.nvim_create_autocmd({ "WinEnter" }, {
    callback = function()
      local window_id = vim.api.nvim_get_current_win()
      -- Skip cases where we are entering popup menus or the detour popup itself.
      if vim.api.nvim_win_get_config(window_id).relative ~= "" or window_id == popup_id then
        return
      end
      -- Check to make sure the popup has not already been closed
      if vim.tbl_contains(vim.api.nvim_list_wins(), popup_id) then
        vim.api.nvim_win_close(popup_id, false)
      end
      -- delete this autocmd if the popup was closed
      return not vim.tbl_contains(vim.api.nvim_list_wins(), popup_id)
    end,
  })
end

local open_detour = function()
  local ok = require("detour").Detour() -- Open a detour popup
  if ok then
    close_on_leave(vim.api.nvim_get_current_win())
  end
end

local open_definitions = function()
  local ok = require("detour").Detour() -- Open a detour popup
  Snacks.picker.lsp_definitions()
  if ok then
    close_on_leave(vim.api.nvim_get_current_win())
  end
end

local open_declarations = function()
  local ok = require("detour").Detour() -- Open a detour popup
  Snacks.picker.lsp_declarations()
  if ok then
    close_on_leave(vim.api.nvim_get_current_win())
  end
end

return {
  "carbon-steel/detour.nvim",
  config = function()
    require("detour").setup()

    local map = vim.keymap.set
    local moves = require("detour.movements")

    map("n", "<C-o>Enter>", open_detour, { desc = "Open current in popup window" })
    map("n", "<C-o>d", open_definitions, { desc = "Goto definitions" })
    map("n", "<C-o>D", open_declarations, { desc = "Goto declarations" })

    map({ "n", "t" }, "<C-j>", moves.DetourWinCmdJ)
    map({ "n", "t" }, "<C-w>j", moves.DetourWinCmdJ)
    map({ "n", "t" }, "<C-w><C-j>", moves.DetourWinCmdJ)

    map({ "n", "t" }, "<C-h>", moves.DetourWinCmdH)
    map({ "n", "t" }, "<C-w>h", moves.DetourWinCmdH)
    map({ "n", "t" }, "<C-w><C-h>", moves.DetourWinCmdH)

    map({ "n", "t" }, "<C-k>", moves.DetourWinCmdK)
    map({ "n", "t" }, "<C-w>k", moves.DetourWinCmdK)
    map({ "n", "t" }, "<C-w><C-k>", moves.DetourWinCmdK)

    map({ "n", "t" }, "<C-l>", moves.DetourWinCmdL)
    map({ "n", "t" }, "<C-w>l", moves.DetourWinCmdL)
    map({ "n", "t" }, "<C-w><C-l>", moves.DetourWinCmdL)

    map({ "n", "t" }, "<C-w>w", moves.DetourWinCmdW)
    map({ "n", "t" }, "<C-w><C-w>", moves.DetourWinCmdW)
  end,
}
