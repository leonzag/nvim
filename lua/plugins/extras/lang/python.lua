local pyright_lsp_opts = {
  single_file_support = true,
  capabilities = {
    textDocument = {
      publishDiagnostics = {
        tagSupport = {
          -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#diagnosticTag
          -- valueSet = { 2 }, -- disable hint "Unnecessary code", only "Depricated" hint shows
        },
      },
    },
  },
  pyright = {
    disableOrganizeImports = true, -- Using Ruff
    disableTaggedHints = true, -- Using Ruff
  },
  python = {
    analysis = {
      -- ignore = { "*" }, -- Using Ruff
      autoSearchPaths = true,
      useLibraryCodeForTypes = false,
      -- extraPaths = { "$VIRTUAL_ENV/lib/**/site-packages" },
      diagnosticMode = "openFilesOnly", -- alternatively "workspace"
      stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
    },
  },
}

local basedpyright_lsp_opts = {
  python = {
    analysis = {
      typeCheckingMode = "standard",
      diagnosticSeverityOverrides = {
        reportUnusedVariable = "information",
      },
    },
  },
}

local function filter(arr, func)
  -- Filter in place
  -- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
  local new_index = 1
  local size_orig = #arr
  for old_index, v in ipairs(arr) do
    if func(v, old_index) then
      arr[new_index] = v
      new_index = new_index + 1
    end
  end
  for i = new_index, size_orig do
    arr[i] = nil
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "microsoft/python-type-stubs",
        -- cond = false,
      },
    },
    opts = {
      servers = {
        basedpyright = basedpyright_lsp_opts,
        pyright = pyright_lsp_opts,
        ruff_lsp = {
          init_options = {
            settings = {
              args = {
                "--ignore=F821,F841",
              },
            },
          },
        },
      },
      setup = {
        basedpyright = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "basedpyright" then
              vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                function(a, params, client_id, c, config)
                  filter(params.diagnostics, function(diagnostic)
                    if string.match(diagnostic.message, '".+" is not accessed') then
                      return false
                    end
                    return true
                  end)
                  vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
                end,
                {}
              )
            end
          end)
        end,
        -- pyright = function()
        --   require("lazyvim.util").lsp.on_attach(function(client, _)
        --     if client.name == "pyright" then
        --       -- future ability for lsp files tracking in workspace
        --       client.config.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
        --     end
        --   end)
        -- end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = {
          "ruff_fix", -- To fix lint errors
          "ruff_format", -- To run the Ruff formatter
          "ruff_organize_imports",
          -- "isort", -- switch to ruff_organize_imports
        },
      },
    },
  },
}
