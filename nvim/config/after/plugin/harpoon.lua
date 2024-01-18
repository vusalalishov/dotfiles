local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

Remap("n", "<leader>a", mark.add_file, {}, "Add file to harpoon")
Remap("n", "<C-e>", ui.toggle_quick_menu, {}, "Harpoon quick menu")

Remap("n", "<C-h>", function() ui.nav_file(1) end, {}, "Harpoon file Nr. 1")
Remap("n", "<C-t>", function() ui.nav_file(2) end, {}, "Harpoon file Nr. 2")
Remap("n", "<C-n>", function() ui.nav_file(3) end, {}, "Harpoon file Nr. 3")
Remap("n", "<C-s>", function() ui.nav_file(4) end, {}, "Harpoon file Nr. 4")
