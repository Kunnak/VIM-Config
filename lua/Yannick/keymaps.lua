vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>E", vim.cmd.Tex)
vim.keymap.set("n", "<leader>Esc", vim.cmd.noh)
vim.keymap.set("n", "<leader>w", 'gt')
vim.keymap.set("n", "<leader>q", 'gT')
vim.keymap.set("n", "<leader><Esc>", ":nohlsearch<CR>")
vim.keymap.set('n', '<C-S-c>', '"+y')
vim.keymap.set('v', '<C-S-c>', '"+y')
vim.keymap.set('n', '<C-S-v>', '"+p')
vim.keymap.set('i', '<C-S-v>', '<C-R>+')

-- Telescope example
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
