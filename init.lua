-- Konfiguration auswählen:
-- "lazy" für deine aktuelle LazyVim-Konfiguration
-- "plug" für die neue vim-plug + CoC Konfiguration
-- "vscode" für die VSCode-spezifische Konfiguration

local config_mode = "plug"  

if vim.g.vscode then
    -- VSCode 
    require('vscode-config')
elseif config_mode == "lazy" then
    -- Lazy
    require('Yannick.options')
    require('Yannick.plugins')
    require('Yannick.keymaps')
    require('Yannick.theme')
    require('Yannick.blink')
    require('Yannick.lsp')
    require('Yannick.telescope')
    require('Yannick.noice')
    require('Yannick.lualine')
    require('Yannick.luasnip')
    require('Yannick.inline-diagnostic')
elseif config_mode == "plug" then
    -- Plug 
    require('init-plug')
else
    -- None
    print("Unbekannter config_mode: " .. config_mode)
    print("Verwende 'lazy', 'plug' oder 'vscode'")
end

