-- ==================================================================================
-- CoC (Conquer of Completion) Konfiguration - Windows-optimiert
-- ==================================================================================

-- CoC Windows-Kompatibilität konfigurieren
vim.g.coc_disable_startup_warning = 1
vim.g.coc_disable_transparent_cursor = 1

-- Node.js Pfad explizit setzen (wichtig für Windows)
if vim.fn.executable('node') == 1 then
    vim.g.coc_node_path = vim.fn.exepath('node')
end

-- CoC Extensions (alle deine benötigten LSPs)
vim.g.coc_global_extensions = {
    -- Web Development
    'coc-tsserver',                      -- TypeScript/JavaScript ✅
    'coc-html',                          -- HTML ✅
    'coc-css',                           -- CSS
    'coc-json',                          -- JSON ✅
    'coc-yaml',                          -- YAML ✅
    'coc-xml',                           -- XML ✅
    
    -- Programming Languages
    'coc-java',                          -- Java ✅
    'coc-lua',                           -- Lua ✅
    'coc-pyright',                       -- Python (optional)
    
    -- Utilities
    'coc-snippets',                      -- Code Snippets
    'coc-pairs',                         -- Auto-Pairing
    'coc-eslint',                        -- ESLint für JavaScript
    
    -- SAP UI5 Support (über TypeScript/JavaScript)
    -- SAP UI5 wird über coc-tsserver unterstützt
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
vim.keymap.set("n", "<leader>cf", "<Plug>(coc-format)", {silent = true, desc = "Format Code (manuell)"})
vim.keymap.set("v", "<leader>cf", "<Plug>(coc-format-selected)", {silent = true, desc = "Format Selection"})
vim.keymap.set("n", "<leader>cF", function()
    vim.cmd("normal! gg=G")  -- Vim native formatting als Alternative
end, {silent = true, desc = "Format Code (Vim native)"})

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
vim.keymap.set("i", "<ENTER>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<ENTER>"]], opts)

-- Global function für Tab-Completion
_G.check_back_space = check_back_space

-- CoC Styling (grauer Hintergrund für Completion Menu)
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

-- Inline Diagnostics Configuration - Virtueller Text IMMER anzeigen
vim.diagnostic.config({
    virtual_text = {
        enabled = true,                  -- Virtuelle Texte IMMER aktivieren
        prefix = "●",                    -- Symbol vor der Nachricht
        spacing = 2,                     -- Abstand zwischen Code und virtueller Text
        severity_sort = true,            -- Nach Schweregrad sortieren
        source = "if_many",              -- Quelle nur anzeigen wenn mehrere vorhanden
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
    signs = {
        enabled = true,                  -- Zeichen in der Sign-Column
        priority = 20,                   -- Priorität der Signs
    },
    float = {
        enabled = false,                 -- KEIN automatisches Hover-Fenster
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'if_many',
        prefix = '',
        scope = 'cursor',
        header = "",
        format = function(diagnostic)
            return diagnostic.message
        end,
    },
})

-- Keybinding für Diagnostic Navigation
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show Diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })