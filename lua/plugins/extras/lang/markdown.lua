return {
  {
    "iamcco/markdown-preview.nvim",
    init = function()
      vim.api.nvim_exec(
        [[
          function! OpenMarkdownPreview(url)
              execute "silent ! firefox --new-window " . a:url
          endfunction
        ]],
        true
      )
      vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
      vim.g.mkdp_auto_start = 0 -- set 1, open preview win fater entering .md buf
      vim.g.mkdp_auto_close = 0 -- set to 1, auto close current preview win on change buf
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark" -- default theme (dark or light)
      vim.g.mkdp_port = "8531"
    end,
  },
}
