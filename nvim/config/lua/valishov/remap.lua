vim.g.mapleader = " "

vim.keymap.set("n", "<C-x>", vim.cmd.Ex, { desc = "Open netrw" })
vim.keymap.set({"n","v"}, "<C-j>", "10j", { desc = "10 lines down" })
vim.keymap.set({"n","v"}, "<C-k>", "10k", { desc = "10 lines up" })

vim.keymap.set("x", "<leader>P", "\"_dp", { desc = "Paste after cursor by preserving the contents of the registry" })

vim.keymap.set("n", "<leader>p", "\"*p", { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>y", "\"*y", { desc = "Yank to system clipboard"})

vim.keymap.set("n", "<leader>q", vim.cmd.bd, { desc = "Close current buffer"})

vim.keymap.set("n", "<leader>wn", function()
    vim.cmd(":tabnew " .. vim.fn.input("Enter tab name: "))
end, { desc = "Open new tab page" })
vim.keymap.set("n", "<leader>wh", vim.cmd.tabprev, { desc = "Go to the prev tab" })
vim.keymap.set("n", "<leader>wl", vim.cmd.tabnext, { desc = "Go to the next tab" })
vim.keymap.set("n", "<leader>wc", vim.cmd.tabclose, { desc = "Close the tab" })
vim.keymap.set("n", "<leader>wL", function() vim.cmd(":+tabmove") end, { desc = "Close the tab" })
vim.keymap.set("n", "<leader>wH", function() vim.cmd(":-tabmove") end, { desc = "Close the tab" })

vim.keymap.set("n", "ss", vim.cmd.wa, { desc = "Save changes!"})

pcall(vim.keymap.del, "v", "<C-m>")
vim.keymap.set("v", "<C-m>", function()
    return ":'<,'>norm! @" .. vim.fn.input("Enter registry id: ") .. "<cr>"
end, { desc = "Apply a macro to selections", expr = true })

vim.keymap.set("n", "<leader>da", vim.cmd.difft, {})
vim.keymap.set("n", "<leader>dc", vim.cmd.diffoff, {})
