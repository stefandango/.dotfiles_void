vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "[P]roject [V]iew (default file explorer)"})

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move selected up"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move selected down"})

vim.keymap.set("n", "J", "mzJ`z", {desc = "[OVERWRITE] - makes cursor stay en save position when using J in normal mode"})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "C-d - keeps cursor in middle of screen if possible"})

vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "C-u - keeps cursor in middle of screen if possible"})

vim.keymap.set("n", "n", "nzzzv", {desc = "Keeps cursor in middle when searching"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Keeps cursoer in middle when searching"})

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP", {desc = "Keeps current buffer when pasting"})

vim.keymap.set("n", "<leader>y", "\"+y", {desc = "Copy to system clipboard"})
vim.keymap.set("v", "<leader>y", "\"+y", {desc = "Copy to system clipboard"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "Copy to system clipboard"})

vim.keymap.set("n", "<leader>d", "\"_d", {desc = "Delete but keep the current clipboard"})
vim.keymap.set("v", "<leader>d", "\"_d", {desc = "Delete but keep the current clipboard"})

vim.keymap.set("n", "Q", "<nop>", {desc = "[OVERWRITE] Dont use..."})

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {desc = "Open other tmux session."})

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", {desc = ""})
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", {desc = ""})
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc = ""})
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc = ""})

-- Command to make current file executable..
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {desc="set chmod+x for current file..", silent = true })
