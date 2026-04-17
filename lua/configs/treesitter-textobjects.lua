require("nvim-treesitter-textobjects").setup {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V", -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
    include_surrounding_whitespace = true,
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
  },
  lsp_interop = {
    enable = true,
    border = "rounded",
    peek_definition_code = {
      ["<leader>df"] = "@function.outer",
      ["<leader>dF"] = "@class.outer",
    },
  },
}
-- You can use the capture groups defined in `textobjects.scm`
local select = require "nvim-treesitter-textobjects.select"
vim.keymap.set({ "x", "o" }, "am", function()
  select.select_textobject("@function.outer", "textobjects")
end, { desc = "function.outer (Treesitter textobject)" })
vim.keymap.set({ "x", "o" }, "im", function()
  select.select_textobject("@function.inner", "textobjects")
end, { desc = "function.inner (Treesitter textobject)" })
vim.keymap.set({ "x", "o" }, "ac", function()
  select.select_textobject("@class.outer", "textobjects")
end, { desc = "class.outer (Treesitter textobject)" })
vim.keymap.set({ "x", "o" }, "ic", function()
  select.select_textobject("@class.inner", "textobjects")
end, { desc = "class.inner (Treesitter textobject)" })
vim.keymap.set({ "x", "o" }, "ao", function()
  select.select_textobject("@loop.outer", "textobjects")
end, { desc = "Outer loop (Treesitter textobject)" })
vim.keymap.set({ "x", "o" }, "io", function()
  select.select_textobject("@loop.inner", "textobjects")
end, { desc = "Inner loop (Treesitter textobject)" })
vim.keymap.set({ "x", "o" }, "ad", function()
  select.select_textobject("@conditional.outer", "textobjects")
end, { desc = "conditional.outer (Treesitter textobject)" })
vim.keymap.set({ "x", "o" }, "id", function()
  select.select_textobject("@conditional.inner", "textobjects")
end, { desc = "conditional.inner (Treesitter textobject)" })
vim.keymap.set({ "x", "o" }, "ab", function()
  select.select_textobject("@block.outer", "textobjects")
end, { desc = "block.outer (Treesitter textobject)" })
vim.keymap.set({ "x", "o" }, "ib", function()
  select.select_textobject("@block.inner", "textobjects")
end, { desc = "block.inner (Treesitter textobject)" })
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function()
  select.select_textobject("@local.scope", "locals")
end, { desc = "local.scope (Treesitter textobject)" })
vim.keymap.set("n", "<leader>a", function()
  require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
end, { desc = "parameter.inner (Treesitter textobject)" })
vim.keymap.set("n", "<leader>A", function()
  require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
end, { desc = "parameter.outer (Treesitter textobject)" })
-- You can use the capture groups defined in `textobjects.scm`
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, { desc = "function.outer (Treesitter textobject)" })
vim.keymap.set({ "n", "x", "o" }, "]]", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, { desc = "class.outer (Treesitter textobject)" })
-- You can also pass a list to group multiple queries.
vim.keymap.set({ "n", "x", "o" }, "]o", function()
  require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end, { desc = "loop.inner (Treesitter textobject)" })
-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
vim.keymap.set({ "n", "x", "o" }, "]s", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
end, { desc = "local.scope (Treesitter textobject)" })
vim.keymap.set({ "n", "x", "o" }, "]z", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end, { desc = "fold (Treesitter textobject)" })

vim.keymap.set({ "n", "x", "o" }, "]M", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end, { desc = "function.outer (Treesitter textobject)" })
vim.keymap.set({ "n", "x", "o" }, "][", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end, { desc = "class.outer (Treesitter textobject)" })

vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, { desc = "function.outer (Treesitter textobject)" })
vim.keymap.set({ "n", "x", "o" }, "[[", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, { desc = "class.outer (Treesitter textobject)" })

vim.keymap.set({ "n", "x", "o" }, "[M", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end, { desc = "function.outer (Treesitter textobject)" })
vim.keymap.set({ "n", "x", "o" }, "[]", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end, { desc = "class.outer (Treesitter textobject)" })

-- Go to either the start or the end, whichever is closer.
-- Use if you want more granular movements
vim.keymap.set({ "n", "x", "o" }, "]d", function()
  require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
end, { desc = "conditional.outer next (Treesitter textobject)" })
vim.keymap.set({ "n", "x", "o" }, "[d", function()
  require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
end, { desc = "conditional.outer previous (Treesitter textobject)" })
