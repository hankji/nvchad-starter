require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt
local g = vim.g

opt.cursorcolumn = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 5
vim.o.cursorlineopt = "number,line"

-- important!
-- :lua require("base46").toggle_transparency()

vim.cmd "silent! command! NvCloseAllBuf lua require('nvchad_ui/tabufline').closeAllBufs('')"
vim.cmd "silent! command! DapuiToggle lua require('dapui').toggle()"

g.mapleader = ","
-- need soft link from ~/config/nvim/snippets to snippets
-- g.luasnippets_path = "./snippets"

-- for folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
-- opt.foldcolumn = 2
-- opt.foldcolumn = auto
-- opt.fillchars = "foldopen:-,foldclose:>"
-- 设置折叠区域的宽度
-- 如果不为0，则在屏幕左侧显示一个折叠标识列
-- 分别用“-”和“+”来标识打开和关闭的折叠 see: h fillchars

-- 1. 为 LSP 悬浮窗口配置圆角 (如 Hover 和 Signature Help)
-- local _border = "rounded"
--
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = _border,
-- })
--
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--   border = _border,
-- })
--
-- -- 2. 为诊断信息 (Diagnostics) 配置圆角
-- vim.diagnostic.config {
--   float = { border = _border },
-- }
