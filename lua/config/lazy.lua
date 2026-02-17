local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Which key 
  {
  "folke/which-key.nvim",
  lazy = false,
  config = function()
    require("which-key").setup({
      delay = 200,
    })
  end,
},
  -- Debugger
  {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = {
        vim.fn.stdpath("data")
          .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
      },
    }

    dap.configurations.javascript = {
      {
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
      },
    }
  end,
},

  --Neotree
  {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({})
    vim.keymap.set("n", "<leader>nt", ":Neotree toggle<CR>")
  end,
},

  -- Lualine
  {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
      },
    })
  end,
},

  -- Noice
  {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({})
  end,
},

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Treesitter
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "clojure", "javascript", "typescript" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
},

  -- LSP
  { "neovim/nvim-lspconfig" },

  -- Mason (LSP installer)
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },

  -- Clojure REPL (VERY IMPORTANT)
  { "Olical/conjure" },

  -- Formatting
  { "stevearc/conform.nvim" },
})

{
  "stevearc/conform.nvim",
  opts = {}
},

{
  "mfussenegger/nvim-lint",
},
