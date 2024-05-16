local M = {}

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "one_light" },
  transparency = false,
  nvdash = { load_on_startup = true },
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    lsprogress_len = 15,
  },
}

return M
