-- Netrw & Ex-Explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>E", vim.cmd.Tex)
vim.keymap.set("n", "<leader>Esc", vim.cmd.noh)
vim.keymap.set("n", "<leader>w", 'gt')
vim.keymap.set("n", "<leader>q", 'gT')
vim.keymap.set("n", "<leader><Esc>", ":nohlsearch<CR>")

-- Funktion: Das Arbeitsverzeichnis auf das aktuelle netrw-Verzeichnis setzen
function SetCwdToNetrw()
  local dir = vim.b.netrw_curdir
  if dir and dir ~= '' then
    vim.cmd('cd ' .. dir)
    print('Arbeitsverzeichnis gesetzt auf: ' .. dir)
  else
    print('Kein netrw-Verzeichnis gefunden.')
  end
end

-- Keymap: <leader>cd setzt das  Arbeitsverzeichnis auf das aktuelle netrw-Verzeichnis
vim.keymap.set('n', '<leader>m', SetCwdToNetrw, { desc = 'Setze Arbeitsverzeichnis auf aktuelles netrw-Verzeichnis' })

-- Telescope-Mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files (incl. subdirs)' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>F', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })