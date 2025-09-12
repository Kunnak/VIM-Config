-- ==================================================================================
-- Neovim Konfiguration mit vim-plug und CoC
-- ==================================================================================
-- Autor: Yannick
-- Beschreibung: LazyVim-ähnliche Erfahrung mit vim-plug Plugin Manager und CoC
-- Features: Telescope, Lualine, Noice, CoC Completion, Gruvbox Theme
-- ==================================================================================

-- ==================================================================================
-- GRUNDEINSTELLUNGEN
-- ==================================================================================

vim.g.mapleader = " "                    -- Leader Key auf Leertaste
vim.o.background = "dark"                -- Dunkler Hintergrund für Theme

-- Appearance
vim.opt.termguicolors = true             -- 24-bit Farben aktivieren
vim.opt.number = true                    -- Zeilennummern anzeigen
vim.opt.relativenumber = true            -- Relative Zeilennummern
vim.opt.cursorline = false               -- Keine Cursor-Linie (für Performance)
vim.opt.signcolumn = "yes"               -- Git/LSP Signs immer anzeigen
vim.opt.guifont = "UbuntuMono Nerd Font:h24"  -- Font für GUI

-- Editing
vim.opt.tabstop = 4                      -- Tab-Breite: 4 Zeichen
vim.opt.shiftwidth = 4                   -- Einrückung: 4 Zeichen
vim.opt.expandtab = true                 -- Tabs zu Leerzeichen konvertieren
vim.opt.smartindent = true               -- Intelligente Einrückung
vim.opt.linebreak = true                 -- Wörter nicht abschneiden
vim.opt.wrap = false                     -- Keine Zeilenumbrüche

-- Search
vim.opt.hlsearch = true                  -- Such-Highlights aktivieren
vim.opt.incsearch = true                 -- Inkrementelle Suche
vim.opt.ignorecase = true                -- Groß-/Kleinschreibung ignorieren
vim.opt.smartcase = true                 -- Außer bei Großbuchstaben in Suche

-- Performance & UX
vim.opt.scrolloff = 8                    -- 8 Zeilen Puffer beim Scrollen
vim.opt.timeoutlen = 200                 -- Kurze Timeout für Key-Kombinationen
vim.opt.undofile = true                  -- Persistente Undo-Historie
vim.opt.clipboard = "unnamedplus"        -- System-Clipboard nutzen

vim.cmd("syntax on")                     -- Syntax-Highlighting aktivieren

-- ==================================================================================
-- PLUGIN INSTALLATION (vim-plug)
-- ==================================================================================

local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Core UI & Theme
Plug('ellisonleao/gruvbox.nvim')         -- Gruvbox Theme
Plug('nvim-lualine/lualine.nvim')        -- Status Line (wie LazyVim)
Plug('nvim-tree/nvim-web-devicons')      -- Icons für UI

-- Command Palette & Notifications (LazyVim-ähnlich)
Plug('folke/noice.nvim')                 -- Command-Palette in der Mitte
Plug('MunifTanjim/nui.nvim')             -- UI-Komponenten für Noice
Plug('rcarriga/nvim-notify')             -- Notifications unten rechts

-- Fuzzy Finder (Telescope statt FZF)
Plug('nvim-lua/plenary.nvim')            -- Lua-Utilities für Telescope
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.5'})  -- Datei-/Text-Suche
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})  -- Performance

-- Code Completion & LSP (CoC statt Mason)
Plug('neoclide/coc.nvim', {branch = 'release'})  -- VSCode-ähnliche Completion

-- Git Integration
Plug('tpope/vim-fugitive')               -- Git-Befehle in Vim
Plug('airblade/vim-gitgutter')           -- Git-Änderungen in Gutter

-- Editing Utilities
Plug('tpope/vim-commentary')             -- Kommentieren mit gcc
Plug('mg979/vim-visual-multi')           -- Multi-Cursor
Plug('windwp/nvim-autopairs')            -- Auto-Pairing für Klammern
Plug('haya14busa/incsearch.vim')         -- Verbesserte Suche

-- Syntax Highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- Moderne Syntax

vim.call('plug#end')

-- ==================================================================================
-- KEYBINDINGS
-- ==================================================================================

-- File Explorer (Netrw)
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Netrw im aktuellen Fenster" })
vim.keymap.set("n", "<leader>E", function()
    vim.cmd('tabnew')
    vim.cmd.Ex()
end, { desc = "Netrw in neuem Tab" })

-- Tab Navigation
vim.keymap.set("n", "<leader>w", 'gt', { desc = "Nächster Tab" })
vim.keymap.set("n", "<leader>q", 'gT', { desc = "Vorheriger Tab" })
vim.keymap.set("n", "<leader>T", ":tabnew<CR>", { desc = "Neuer Tab" })

-- Utilities
vim.keymap.set("n", "<leader><Esc>", ":nohlsearch<CR>", { desc = "Such-Highlights löschen" })

-- Verzeichnis-Management
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
vim.keymap.set('n', '<leader>m', change_to_current_dir, { desc = 'Zum Datei-Verzeichnis wechseln' })

-- ==================================================================================
-- COC CONFIGURATION
-- ==================================================================================

-- CoC Extensions (automatische Installation)
vim.g.coc_global_extensions = {
    'coc-tsserver',                      -- TypeScript/JavaScript
    'coc-json',                          -- JSON
    'coc-html',                          -- HTML
    'coc-css',                           -- CSS
    'coc-pyright',                       -- Python
    'coc-rust-analyzer',                 -- Rust
    'coc-clangd',                        -- C/C++
    'coc-java',                          -- Java
    'coc-snippets',                      -- Code Snippets
    'coc-pairs',                         -- Auto-Pairing
    'coc-eslint'                         -- ESLint
}

-- CoC UI Styling
vim.g.coc_borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'}

-- LSP-ähnliche Keybindings
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true, desc = "Go to Definition"})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true, desc = "Go to Type Definition"})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true, desc = "Go to Implementation"})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true, desc = "Show References"})
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true, desc = "Rename Symbol"})
vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction)", {silent = true, desc = "Code Actions"})
vim.keymap.set("n", "<leader>k", "<Plug>(coc-documentation)", {silent = true, desc = "Show Documentation"})

-- Formatierung (manuell, da Auto-Format deaktiviert ist)
vim.keymap.set("n", "<leader>cf", "<Plug>(coc-format)", {silent = true, desc = "Format Code"})
vim.keymap.set("v", "<leader>cf", "<Plug>(coc-format-selected)", {silent = true, desc = "Format Selection"})

-- Hover Documentation (wie VSCode)
local function show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.keymap.set("n", "K", show_docs, {silent = true, desc = "Show Documentation"})

-- Tab-Completion (VSCode-ähnlich)
local function check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Global function für Tab-Completion
_G.check_back_space = check_back_space

-- ==================================================================================
-- PLUGIN CONFIGURATION (nach Plugin-Load)
-- ==================================================================================

vim.defer_fn(function()
    
    -- Alte Plugins deaktivieren
    vim.g.loaded_airline = 1             -- Airline deaktivieren (nutzen Lualine)
    
    -- === NETRW SETUP ===
    -- Netrw Styling (ohne liststyle, da das VSCode verwirrt)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "netrw",
        callback = function()
            vim.opt_local.cursorline = false
        end,
    })
    
    -- === THEME & COLORS ===
    pcall(function()
        vim.cmd([[colorscheme gruvbox]])
        
        -- Transparenter Hintergrund
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        
        -- Zeilennummern-Styling
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#aaaaaa" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff8800", bold = true })
        
        -- CoC Completion Menu (grauer Hintergrund)
        vim.cmd([[
            highlight Pmenu guibg=#3a3a3a guifg=#ffffff
            highlight PmenuSel guibg=#5a5a5a guifg=#ffffff
            highlight PmenuSbar guibg=#2a2a2a
            highlight PmenuThumb guibg=#6a6a6a
            highlight CocFloating guibg=#3a3a3a guifg=#ffffff
            highlight CocMenuSel guibg=#5a5a5a guifg=#ffffff
            
            " CoC Documentation Styling
            highlight CocHoverRange guibg=#4a4a4a guifg=#ffffff
            highlight CocErrorFloat guibg=#3a3a3a guifg=#ff6b6b
            highlight CocWarningFloat guibg=#3a3a3a guifg=#ffd700
            highlight CocInfoFloat guibg=#3a3a3a guifg=#87ceeb
            highlight CocHintFloat guibg=#3a3a3a guifg=#98fb98
        ]])
    end)

    -- === NOICE SETUP (Command-Palette + Notifications) ===
    pcall(function()
        -- Notifications Setup
        vim.cmd([[highlight NotifyBackground guibg=#000000]])
        require("notify").setup({
            background_colour = "#000000",
            top_down = false,            -- Notifications unten rechts
            stages = "fade",
            render = "compact",
            timeout = 3000,
        })
        vim.notify = require("notify")
        
        -- Noice Setup (Command-Palette in der Mitte)
        require("noice").setup({
            presets = { 
                command_palette = true,  -- Command-Palette in der Mitte
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
            cmdline = {
                view = "cmdline_popup",  -- Popup in der Mitte
                format = {
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = "🔍", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = "🔍", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "💡" },
                },
            },
            messages = {
                view = "notify",
            },
            notify = {
                enabled = true,
                view = "notify",
            },
        })
    end)

    -- === LUALINE SETUP (Status Line) ===
    pcall(function()
        require('lualine').setup {
            options = {
                theme = 'gruvbox',
                icons_enabled = true,
            }
        }
    end)

    -- === TELESCOPE SETUP (Fuzzy Finder mit grauen Hintergründen) ===
    pcall(function()
        require('telescope').setup{
            defaults = {
                -- UI Styling
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                results_title = false,
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                -- Ignored Files/Directories
                file_ignore_patterns = {
                    "^%.",
                    "/%.",
                    "node_modules/",
                    "%.git/",
                    "%.lock",
                    "%.png",
                    "%.jpg",
                    "%.ogg",
                    "build/",
                    "%.cache/*",
                    "%.cargo/*",
                    "%.DS_Store",
                },
            }
        }
        
        -- Telescope Styling (graue Hintergründe)
        vim.cmd([[
            highlight TelescopeNormal guibg=#2a2a2a
            highlight TelescopeBorder guibg=#2a2a2a guifg=#5a5a5a
            highlight TelescopePromptNormal guibg=#3a3a3a
            highlight TelescopePromptBorder guibg=#3a3a3a guifg=#6a6a6a
            highlight TelescopePromptTitle guibg=#ff8800 guifg=#000000
            highlight TelescopePreviewTitle guibg=#5a5a5a guifg=#ffffff
            highlight TelescopeResultsTitle guibg=#5a5a5a guifg=#ffffff
        ]])
        
        -- Telescope Keybindings
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope: Find Files' })
        vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope: Live Grep' })
        vim.keymap.set('n', '<leader>F', builtin.buffers, { desc = 'Telescope: Buffers' })
        vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope: Help Tags' })
    end)

    -- === TREESITTER SETUP (Syntax Highlighting) ===
    pcall(function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "lua", "javascript", "typescript", "python", "rust", "c", "cpp", "java" },
            highlight = {
                enable = true,
            },
        }
    end)

    -- === AUTOPAIRS SETUP ===
    pcall(function()
        require("nvim-autopairs").setup({})
    end)

end, 100)

-- ==================================================================================
-- INLINE DIAGNOSTICS CONFIGURATION
-- ==================================================================================

-- Virtuelle Texte für Inline-Diagnostics aktivieren
vim.diagnostic.config({
    virtual_text = {
        enabled = true,                  -- Virtuelle Texte aktivieren
        prefix = "●",                    -- Symbol vor der Nachricht
        spacing = 2,                     -- Abstand zwischen Code und virtueller Text
        severity_sort = true,            -- Nach Schweregrad sortieren
        format = function(diagnostic)
            -- Format: [ERROR] Nachricht
            local severity_map = {
                [vim.diagnostic.severity.ERROR] = "ERROR",
                [vim.diagnostic.severity.WARN] = "WARN",
                [vim.diagnostic.severity.INFO] = "INFO",
                [vim.diagnostic.severity.HINT] = "HINT",
            }
            local severity = severity_map[diagnostic.severity] or "UNKNOWN"
            return string.format("[%s] %s", severity, diagnostic.message)
        end,
    },
    underline = true,                    -- Fehler unterstreichen
    update_in_insert = false,            -- Nicht während Tippen aktualisieren
    severity_sort = true,                -- Nach Schweregrad sortieren
    signs = true,                        -- Zeichen in der Sign-Column
    float = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = '',
        scope = 'cursor',
    },
})

-- Keybinding für Diagnostic Navigation
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show Diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })

-- ==================================================================================
