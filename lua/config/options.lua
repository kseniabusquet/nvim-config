vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- clear search highlight
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "clojure",
    "javascript",
    "typescript",
    "svelte",
    "lua"
  },
  highlight = { enable = true },
})

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
