local builtin = require('telescope.builtin')

local telescope  = require("telescope")
--vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
--vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
--vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "[G]oto [R]eferences"})
--vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = ""})
--vim.keymap.set('n', '<leader>ps', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") });
--end)

telescope.setup {

    pickers = {

        find_files = {

            hidden = true,
            file_ignore_patterns = { ".git/.*", "node%_mopdules/.*" }

        }

    }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "[F]ind [f]iles"})
vim.keymap.set('n', '<leader>fg', builtin.find_files, {desc = "[F]ind [f]iles"})
vim.keymap.set('n', '<leader>fr', builtin.live_grep, {desc = "[F]ind [g]rep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "[F]ind [b]uffer"})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "[F]ind [h]elp_tags - nvim docs"})
vim.keymap.set('n', '<leader>fh', builtin.keymaps, {desc = "[F]ind [H]elp - view all shortcuts"})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "[F]ind [d]iagnostics - view all"})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = "Search oldfiles"})

--vim.api.nvim_set_keymap("n", "<space>fe", ":Telescope file_browser<CR>", { noremap = true })
