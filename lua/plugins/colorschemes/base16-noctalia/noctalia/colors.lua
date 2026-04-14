local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#0c1017", -- Default Background
    base01 = "#11151d", -- Lighter Background (status bars)
    base02 = "#191e2a", -- Selection Background
    base03 = "#45a0d6", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#9b6bc1", -- Dark Foreground (status bars)
    base05 = "#5c8ac4", -- Default Foreground
    base06 = "#5c8ac4", -- Light Foreground
    base07 = "#5c8ac4", -- Lightest Foreground
    -- Accent colors
    base08 = "#b32d2d", -- Variables, XML Tags, Errors
    base09 = "#00a66c", -- Integers, Constants
    base0A = "#d14358", -- Classes, Search Background
    base0B = "#c4a82e", -- Strings, Diff Inserted
    base0C = "#80ffd2", -- Regex, Escape Chars
    base0D = "#e9d996", -- Functions, Methods
    base0E = "#e996a2", -- Keywords, Storage
    base0F = "#430a0a", -- Deprecated, Embedded Tags
  })
end

return M
