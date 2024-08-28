require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "jj", "<ESC>", { desc = "Escape insert mode" })

-- telescope
map("n", "<leader>re", "<cmd> Telescope resume <CR>",{ desc = "   resume show"})
map("n", "<leader>fs", "<cmd> Telescope grep_string <CR>", { desc ="   grep_string"})
map("n", "<F2>", "<cmd> Telescope lsp_document_symbols <CR>", { desc ="   list document symbols"})

-- dapui
map("n", "<leader>kk","<cmd> lua require('dapui').eval() <CR>", { desc ="show variable value in dapui"})

-- lspconfig 
map("n","<leader>fm", function()
      vim.lsp.buf.format()
end, {desc = "   lsp formatting"})
map("n","<leader>of", function()
      vim.diagnostic.open_float()
end,{desc = "floating diagnostic"})

