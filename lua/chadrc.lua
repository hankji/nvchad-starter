-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

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
