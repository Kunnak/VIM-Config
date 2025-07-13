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

-- Setze die Highlight-Gruppe explizit, bevor notify geladen wird
vim.cmd([[highlight NotifyBackground guibg=#000000]])

require("notify").setup({
  background_colour = "#000000",
})

vim.notify = require("notify")
