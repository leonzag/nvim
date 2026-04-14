-- Здесь мы жестко храним созданные терминалы: my_terms[1] и my_terms[2]
local my_terms = {}
local current_pos = "right"

-- Безопасная функция получения терминала (проверяет, не убит ли процесс/буфер)
local function get_term(id)
  local t = my_terms[id]
  if t and t.buf and vim.api.nvim_buf_is_valid(t.buf) then
    return t
  end
  return nil
end

-- Умный показ/создание: всегда открывает терминал с актуальной стороны
local function show_term(id, target_pos)
  local t = get_term(id)

  -- Формируем красивый заголовок
  local cmd = vim.fn.fnamemodify(vim.o.shell, ":t")
  local cwd = vim.fn.fnamemodify(LazyVim.root(), ":t")
  local title = string.format(" %%#Title#%d:%%*   %%#Keyword#%s%%*  󰉖 %%#String#%s%%* ", id, cmd, cwd)

  if t then
    -- Если терминал жив, жестко перезаписываем кэш позиции на всех уровнях
    if t.opts then
      t.opts.position = target_pos
      if t.opts.win then
        t.opts.win.position = target_pos
      end
    end
    t:show()
  else
    -- Если терминала нет (или процесс убит), создаем с нуля и запоминаем
    my_terms[id] = Snacks.terminal(nil, {
      env = { SNACKS_TERM_ID = tostring(id) },
      win = { position = target_pos, wo = { winbar = title } },
    })
  end
end

-- Основная логика для <A-\> и <A-t>
local function toggle_all(target_pos)
  current_pos = target_pos
  local any_visible = false
  local active_ids = {}

  -- Проверяем состояние только наших 1 и 2 терминалов
  for id = 1, 2 do
    local t = get_term(id)
    if t then
      table.insert(active_ids, id)
      if t:win_valid() then
        any_visible = true
      end
    end
  end

  if any_visible then
    -- Если хоть один терминал на экране -> прячем абсолютно всё
    for _, id in ipairs(active_ids) do
      local t = get_term(id)
      if t then
        t:hide()
      end
    end
  else
    -- Если на экране ничего нет
    if #active_ids == 0 then
      -- Сценарий 1: Мы только зашли в Neovim, терминалов нет. Создаем первый.
      show_term(1, target_pos)
    else
      -- Сценарий 2: Терминалы скрыты в фоне. Достаем и показываем все существующие!
      for _, id in ipairs(active_ids) do
        show_term(id, target_pos)
      end
    end
  end
end

-- Логика для индивидуальных шорткатов <A-1> и <A-2>
local function toggle_specific(id)
  local t = get_term(id)
  -- Если он уже на экране - прячем именно его
  if t and t:win_valid() then
    t:hide()
  else
    -- Иначе показываем с текущей активной стороны
    show_term(id, current_pos)
  end
end

local binds = {
  {
    "<A-;>",
    function()
      Snacks.terminal("zsh", { cwd = LazyVim.root(), win = { position = "float" } })
    end,
    mode = { "i", "n", "v", "t" },
    desc = "Term Float",
  },
  {
    "<A-1>",
    function()
      toggle_specific(1)
    end,
    mode = { "i", "n", "v", "t" },
    desc = "Term-1 Toggle",
  },
  {
    "<A-2>",
    function()
      toggle_specific(2)
    end,
    mode = { "i", "n", "v", "t" },
    desc = "Term-2 Toggle",
  },
  {
    "<A-\\>",
    function()
      toggle_all("right")
    end,
    mode = { "i", "n", "v", "t" },
    desc = "Toggle ALL Right",
  },
  {
    "<A-t>",
    function()
      toggle_all("bottom")
    end,
    mode = { "i", "n", "v", "t" },
    desc = "Toggle ALL Bottom",
  },
  {
    "<A-c>",
    function()
      local cur_buf = vim.api.nvim_get_current_buf()
      -- Ищем, принадлежит ли текущий фокус какому-либо из терминалов Snacks
      for _, term in ipairs(Snacks.terminal.list()) do
        if term.buf == cur_buf then
          term:hide() -- Аккуратно прячем его (процесс продолжает работать)
          return
        end
      end
    end,
    mode = { "i", "n", "v", "t" },
    desc = "Hide Focused Terminal",
  },
}

return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    keys = keys,
    -- keys = keys, -- disabled
    opts = {
      terminal = {
        enabled = false,
        bo = { filetype = "snacks_terminal" },
        wo = {},
        stack = true,
        win = {
          style = "terminal",
          title = "Terminal",
          border = true,
        },
      },
    },
  },
}
