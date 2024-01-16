vim.g.mapleader = " "

vim.keymap.set("n", "<C-x>", vim.cmd.Ex)
vim.keymap.set("n", "<C-j>", "10j")
vim.keymap.set("n", "<C-k>", "10k")

vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set("x", "<leader>P", "\"_dP")

vim.keymap.set("n", "<leader>p", "\"*p")
vim.keymap.set("v", "<leader>y", "\"*y")
