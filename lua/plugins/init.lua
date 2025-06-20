local overrides = require "configs.overrides"

return {
  -- 与null-ls功能重复
  -- {
  --   "stevearc/conform.nvim",
  --   config = function()
  --     require "configs.conform"
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        -- "jose-elias-alvarez/null-ls.nvim",
        "nvimtools/none-ls.nvim",
        config = function()
          require "configs.null-ls"
        end,
      },
    },
    config = function()
      -- require("nvchad.configs.lspconfig").defaults()
      require "configs.lsp-config"
    end,
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  -- {
  -- 	"nvim-tree/nvim-tree.lua",
  -- 	opts = overrides.nvimtree,
  -- },

  {
    "mason-org/mason.nvim",
    opts = overrides.mason,
  },

  -- Install a plugin
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    config = function()
      require "configs.treesitter-context"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- after = "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    config = function()
      require "configs.treesitter-textobjects"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require("configs.gitsigns").gitsigns,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require("pretty-fold").setup {
        remove_fold_markers = false,
      }
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  {
    "folke/which-key.nvim",
    enabled = true,
    -- this is config for which-key group, https://github.com/NvChad/NvChad/issues/1246
    -- config = function(_, opts)
    --   dofile(vim.g.base46_cache .. "whichkey")
    --   require("which-key").setup(opts)
    --   local present, wk = pcall(require, "which-key")
    --   if not present then
    --     return
    --   end
    --   wk.register {
    --     -- add group
    --     ["<leader>"] = {
    --       f = { name = "+file" },
    --     },
    --   }
    -- end,
    -- setup = function()
    --   require("core.utils").load_mappings "whichkey"
    -- end,
  },

  -- 暂时关闭,https://todo.sr.ht/~whynothugo/lsp_lines.nvim/44
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup { chunk = { enable = true } }
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
  -- {
  --   "ggandor/leap.nvim",
  --   config = function()
  --     require("leap").add_default_mappings()
  --     vim.keymap.del({ "x", "o" }, "x")
  --     vim.keymap.del({ "x", "o" }, "X")
  --     vim.keymap.set("n", "s", function()
  --       local current_window = vim.fn.win_getid()
  --       require("leap").leap { target_windows = { current_window } }
  --     end)
  --   end,
  -- },
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    config = function()
      local dropbar_api = require "dropbar.api"
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
    -- optional, but required for fuzzy finder support
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = require("configs.flash_opt").option,
    keys = require("configs.flash_opt").keys,
  },
  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("mini.diff").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.custom-dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require "configs.custom-dapui"
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup()
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
  },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
}
