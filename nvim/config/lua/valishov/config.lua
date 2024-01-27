local tabsize = 4

vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.lcs = "multispace:...|,space:.,tab:>-"
vim.opt.list = true

vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim-undo"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 100

vim.g.mapleader = " "


vim.opt.smartcase = true
vim.opt.ignorecase = true

local argo_group = vim.api.nvim_create_augroup("argo_yaml", { clear = true })
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.argo-yaml",
    command = "set filetype=yaml",
    group = argo_group
})
