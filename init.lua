-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({

  ------------------------------------------------------------------
  -- Treesitter
  ------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "clojure",
        "javascript",
        "typescript",
        "tsx",
	"python",
	"markdown",
	"bash",
	"yaml",
	"html",
	"css"
      },
      highlight = { enable = true },
    },
  },

  ------------------------------------------------------------------
  -- Mason
  ------------------------------------------------------------------
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  ------------------------------------------------------------------
  -- LSP (Neovim 0.11 style)
  ------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
  },

  ------------------------------------------------------------------
  -- Autocomplete
  ------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("config.cmp")
    end,
  },

  ------------------------------------------------------------------
  -- Formatting (modern)
  ------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    config = function()
      require("config.format")
    end,
  },

  ------------------------------------------------------------------
  -- Linting
  ------------------------------------------------------------------
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("config.lint")
    end,
  },

  ------------------------------------------------------------------
  -- Clojure REPL
  ------------------------------------------------------------------
  { "Olical/conjure" },

  ------------------------------------------------------------------
  -- Telescope (Doom power)
  ------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  ------------------------------------------------------------------
  -- Git signs
  ------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },

})
