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

-- ~/.aws/config, credentials 를 전용 filetype 으로 (내장 confini 감지를 덮어씀)
vim.filetype.add({
  pattern = {
    [".*/%.aws/config"] = "awsconfig",
    [".*/%.aws/credentials"] = "awsconfig",
  },
})

-- aws config 하이라이트 색 (colorscheme 뒤에 와야 함)
local function set_aws_hl()
  local hl = vim.api.nvim_set_hl
  hl(0, "awsConfigHeader",  { fg = "#7dcfff", bold = true })
  hl(0, "awsConfigKey",     { fg = "#73daca" })
  hl(0, "awsConfigFlag",    { fg = "#7aa2f7", bold = true })
  hl(0, "awsConfigArn",     { fg = "#ff9e64" })
  hl(0, "awsConfigAccount", { fg = "#e0af68", bold = true })
  hl(0, "awsConfigRole",    { fg = "#f7768e", bold = true })
  hl(0, "awsConfigEmail",   { fg = "#bb9af7", underline = true })
  hl(0, "awsConfigCommand", { fg = "#2ac3de", bold = true })
  hl(0, "awsConfigRegion",  { fg = "#73daca", italic = true })
end
set_aws_hl()

-- 컬러스킴을 바꿔도 색이 유지되도록
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_aws_hl })
