local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "pyright" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      gofumpt = true,
      usePlaceholders = true,
      codelenses = {
        generate = true,
        gc_details = true,
      },
      -- hints = {
      --   assignVariableTypes = true,
      --   compositeLiteralFields = true,
      --   compositeLiteralTypes = true,
      --   constantValues = true,
      --   functionTypeParameters = true,
      --   parameterNames = true,
      --   rangeVariableTypes = true,
      -- },
      semanticTokens = true,
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config {
  -- virtual_text = false,
  virtual_lines = false,
  virtual_text = {
    prefix = "●", -- 可以是图标、"●"、"■"等
    spacing = 4, -- 与文本的间距
    severity = vim.diagnostic.severity.ERROR, -- 只显示 ERROR 级别
    format = function(diagnostic)
      return diagnostic.code or diagnostic.message
    end,
  },
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  float = {
    show_header = true,
    source = "always",
    border = "rounded",
    format = function(d)
      return string.format("%s [%s]", d.message, d.source)
    end,
  },
}
