-- ==================================================================================
-- Keybindings - Zentrale Tastenkombinationen
-- ==================================================================================
-- Gemeinsame Keybindings für alle Plugin-Manager
-- Plugin-spezifische Keybindings werden in den jeweiligen Plugin-Konfigurationen definiert
-- ==================================================================================

-- ==================================================================================
-- DATEI-EXPLORER (Netrw)
-- ==================================================================================

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { 
    desc = "Netrw Explorer öffnen" 
})
vim.keymap.set("n", "<leader>E", function()
    vim.cmd('tabnew')
    vim.cmd.Ex()
end, { 
    desc = "Netrw in neuem Tab" 
})

-- ==================================================================================
-- TAB-NAVIGATION
-- ==================================================================================

vim.keymap.set("n", "<leader>w", 'gt', { 
    desc = "Nächster Tab" 
})
vim.keymap.set("n", "<leader>q", 'gT', { 
    desc = "Vorheriger Tab" 
})
vim.keymap.set("n", "<leader>T", ":tabnew<CR>", { 
    desc = "Neuer Tab" 
})

-- ==================================================================================
-- UTILITIES
-- ==================================================================================

vim.keymap.set("n", "<leader><Esc>", ":nohlsearch<CR>", { 
    desc = "Such-Highlights löschen" 
})

-- ==================================================================================
-- VERZEICHNIS-MANAGEMENT
-- ==================================================================================

-- Verzeichnis zum aktuellen Dateipfad wechseln und Explorer öffnen
local function change_to_current_dir()
    local current_file = vim.fn.expand('%:p:h')
    if current_file ~= '' then
        vim.cmd('cd ' .. current_file)
        print('Arbeitsverzeichnis: ' .. current_file)
        vim.cmd('Ex')
    else
        local cwd = vim.fn.getcwd()
        print('Arbeitsverzeichnis: ' .. cwd)
        vim.cmd('Ex')
    end
end

vim.keymap.set('n', '<leader>m', change_to_current_dir, { 
    desc = 'Zum Datei-Verzeichnis wechseln' 
})

-- ==================================================================================
-- TELESCOPE KEYBINDINGS (nur wenn verfügbar)
-- ==================================================================================

-- Sichere Telescope-Keybindings mit Fallback
local function setup_telescope_keymaps()
    local ok, builtin = pcall(require, 'telescope.builtin')
    if ok then
        vim.keymap.set('n', '<leader>f', builtin.find_files, { 
            desc = 'Telescope: Find Files' 
        })
        vim.keymap.set('n', '<leader>g', builtin.live_grep, { 
            desc = 'Telescope: Live Grep' 
        })
        vim.keymap.set('n', '<leader>F', builtin.buffers, { 
            desc = 'Telescope: Buffers' 
        })
        vim.keymap.set('n', '<leader>h', builtin.help_tags, { 
            desc = 'Telescope: Help Tags' 
        })
    else
        -- Fallback wenn Telescope nicht verfügbar
        vim.keymap.set('n', '<leader>f', ':find ', { 
            desc = 'Find Files (native)' 
        })
        vim.keymap.set('n', '<leader>F', ':buffers<CR>', { 
            desc = 'Show Buffers' 
        })
    end
end

-- Telescope Keymaps laden (mit Fehlerbehandlung)
setup_telescope_keymaps()