-- Basiseinstellungen und Module laden
vim.g.mapleader = " "
require("Yannick.options")
require("Yannick.keymaps")
require("Yannick.plugins")

-- Pluginspezifische Configs
require("Yannick.lsp")
require("Yannick.theme")
require("Yannick.lualine")
require("Yannick.noice")
require("Yannick.telescope")
require("Yannick.signs")
require("Yannick.inline-diagnostic")
require("Yannick.blink")
require("Yannick.luasnip")

