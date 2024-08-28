-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
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
