-- Setze die Highlight-Gruppe explizit, bevor notify geladen wird
vim.cmd([[highlight NotifyBackground guibg=#000000]])

require("notify").setup({
    background_colour = "#000000",
})

vim.notify = require("notify")

require("noice").setup({
    presets = { command_palette = true }
})
