local builtin = require('telescope.builtin')
vim.keymap.set('n', 'gf', builtin.find_files, {})
vim.keymap.set('n', 'ff', builtin.git_files, {})
vim.keymap.set('n', '<C-g>', function()
	builtin.live_grep();
end)
