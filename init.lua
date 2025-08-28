-- Basiseinstellungen und Module laden
vim.g.mapleader = " "

-- VSCode Erkennung und separate Konfiguration
if vim.g.vscode then
    -- VSCode-spezifische Konfiguration
    require("vscode-config")
else
    -- Standard Neovim Konfiguration
    require("Yannick.options")
    require("Yannick.keymaps")
    require("Yannick.plugins")

    -- Pluginspezifische Configs (nur für standalone Neovim)
    require("Yannick.lsp")
    require("Yannick.theme")
    require("Yannick.lualine")
    require("Yannick.noice")
    require("Yannick.telescope")
    require("Yannick.signs")
    require("Yannick.inline-diagnostic")
    require("Yannick.blink")
    require("Yannick.luasnip")
end

