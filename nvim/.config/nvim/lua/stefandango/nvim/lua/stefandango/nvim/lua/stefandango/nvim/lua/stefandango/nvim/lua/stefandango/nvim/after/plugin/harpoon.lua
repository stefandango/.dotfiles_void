local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc ="Add file to harpoon"})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "Harpoon files"})

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, {desc="Goto first [1] harpoon file"})
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, {desc="Goto second [2] harpoon file"})
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, {desc="Goto third [3] harpoon file"})
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, {desc="Goto fouth [4] harpoon file"})

