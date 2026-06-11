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

-- ~/.kube/config 를 yaml 로
vim.filetype.add({
  pattern = {
    [".*/%.kube/config"] = "yaml",
  },
})

-- kubeconfig 하이라이트 색
local function set_kube_hl()
  local hl = vim.api.nvim_set_hl
  hl(0, "kubeUrl",        { fg = "#7aa2f7", underline = true })
  hl(0, "kubeCluster",    { fg = "#ff9e64", bold = true })
  hl(0, "kubeNamespace",  { fg = "#f7768e", bold = true })
  hl(0, "kubeCurrentCtx", { fg = "#9ece6a", bold = true })
  hl(0, "kubeAwsProfile", { fg = "#e0af68", bold = true })
  hl(0, "kubeCommand",    { fg = "#2ac3de", bold = true })
  hl(0, "kubeToken",      { fg = "#565f89", italic = true })
end
set_kube_hl()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_kube_hl })

-- k8s manifest 하이라이트 색
local function set_k8s_hl()
  local hl = vim.api.nvim_set_hl
  hl(0, "k8sKind",      { fg = "#bb9af7", bold = true })
  hl(0, "k8sName",      { fg = "#9ece6a", bold = true })
  hl(0, "k8sNamespace", { fg = "#f7768e", bold = true })
  hl(0, "k8sImage",     { fg = "#ff9e64" })
  hl(0, "k8sImageTag",  { fg = "#e0af68", bold = true })
  hl(0, "k8sArn",       { fg = "#ff9e64" })
  hl(0, "k8sAccount",   { fg = "#e0af68", bold = true })
  hl(0, "k8sLabelKey",  { fg = "#7dcfff", italic = true })
  hl(0, "k8sTimestamp", { fg = "#565f89", italic = true })
  hl(0, "k8sUid",       { fg = "#565f89", italic = true })
end
set_k8s_hl()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_k8s_hl })
