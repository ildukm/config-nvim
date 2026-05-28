vim.opt.termguicolors = true
vim.opt.number = true

vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "master",
  },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "typescript", "tsx", "json", "lua" },
  highlight = { enable = true },
})

vim.cmd.colorscheme("tokyonight-storm")
