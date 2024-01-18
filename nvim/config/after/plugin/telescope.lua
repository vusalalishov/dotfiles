local builtin = require('telescope.builtin')
Remap('n', 'gf', builtin.find_files, {}, "Find files in project")
Remap('n', 'ff', builtin.git_files, {}, "Find files in git")
Remap('n', '<leader>b', builtin.buffers, {}, "List open buffers")
Remap('n', '<leader>f', builtin.quickfix, {}, "List quickfix")
Remap('n', '<C-g>', function()
	builtin.live_grep();
end, {}, "Live grep")
