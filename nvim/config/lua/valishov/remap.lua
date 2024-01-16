vim.g.mapleader = " "

Remap("n", "<C-x>", vim.cmd.Ex, "Open netrw")
Remap("n", "<C-j>", "10j", "10 lines down")
Remap("n", "<C-k>", "10k", "10 lines up")

Remap("x", "<leader>p", "\"_dp", "Paste after cursor by preserving the contents of the registry")
Remap("x", "<leader>P", "\"_dP", "Paste before cursor by preserving the contents of the registry")

Remap("n", "<leader>p", "\"*p", "Paste from system clipboard")
Remap("v", "<leader>y", "\"*y", "Yank to system clipboard")
