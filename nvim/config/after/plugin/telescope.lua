local builtin = require('telescope.builtin')
vim.keymap.set('n', 'gf', builtin.find_files, { desc = "Find files in project" })
vim.keymap.set('n', 'ff', builtin.git_files, { desc = "Find files in git" })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "List open buffers" })
vim.keymap.set('n', '<leader>f', builtin.quickfix, { desc = "List quickfix" })
vim.keymap.set('n', '<C-e>', builtin.marks, { desc = "Show marks" })
vim.keymap.set('n', '<leader>mc', function() vim.cmd(":delm! | delm 0-9A-Za-z") end, { desc = "Clear marks" })
vim.keymap.set('n', '<C-g>', function()
	builtin.live_grep();
end, { desc = "Live grep" })
vim.keymap.set("n", "<C-s>", function() builtin.lsp_dynamic_workspace_symbols{ symbols = "class" } end, { desc = "Workspace symbols" })
vim.keymap.set("n", "<C-d>", builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>vd", builtin.diagnostics, { desc = "Open diagnostics floating window" })

-- vim.keymap.set("n", "go", function()
--     local line_number = vim.api.nvim_win_get_cursor(0)[1]
--     print(vim.inspect(ev))
-- end, {desc="d"})

-- print(vim.inspect(vim.api.nvim_buf_get_name(0)))
-- print(vim.inspect(io.popen("echo 'hi'"):lines(2)()))
--
-- local on_exit = function(obj)
--   print(obj.code)
--   print(obj.signal)
--   print(obj.stdout)
--   print(obj.stderr)
-- end
-- Runs asynchronously:
-- vim.system({'echo', 'hello'}, { text = true }, on_exit)
-- -- Runs synchronously:
-- local obj = vim.system({'echo', 'hello'}, { text = true }):wait()
-- -- { code = 0, signal = 0, stdout = 'hello', stderr = '' }
--
-- vim.system({ "echo", "'hi'" }, {text = true}, function(obj)
--     print(vim.inspect(obj))
-- end)




-- local builtin = require("telescope.builtin")
-- local actions = require("telescope.actions")
--
-- require("telescope").setup {
--     defaults = {
--         file_ignore_patterns = { "node_modules", ".git", ".venv" },
--         mappings = {
--             n = {
--                 ["gf"] = builtin.find_files,
--                 ["ff"] = builtin.git_files,
--                 ["<leader>b"] = builtin.buffers,
--                 ["<leader>f"] = builtin.quickfix,
--                 ["<C-e>"] = builtin.marks,
--                 ["<leader>mc"] = function() vim.cmd(":delm! | delm 0-9A-Za-z") end,
--                 ["<C-g>"] = builtin.live_grep,
--                 ["<C-s>"] = function() builtin.lsp_dynamic_workspace_symbols{ symbols = "class" } end,
--                 ["<C-d>"] = builtin.lsp_document_symbols,
--                 ["<C-q>"] = actions.send_selected_to_qflist,
--                 ["<leader>vd"] = builtin.diagnostics,
--             }
--         },
--     }
-- }
