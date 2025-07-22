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
<<<<<<< HEAD
require("Yannick.inline-diagnostic")
require("Yannick.blink")
require("Yannick.luasnip")

=======

-- Setze die Highlight-Gruppe explizit, bevor notify geladen wird
vim.cmd([[highlight NotifyBackground guibg=#000000]])

require("notify").setup({
  background_colour = "#000000",
})

vim.notify = require("notify")
>>>>>>> 09912af93e3b76da44bb862f95910461de204c6c
