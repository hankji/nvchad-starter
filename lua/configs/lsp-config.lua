local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "pyright","shellcheck" }
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
  virtual_text = false,
  virtual_lines = true,
}
