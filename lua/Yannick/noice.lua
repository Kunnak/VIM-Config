-- Setze die Highlight-Gruppe explizit, bevor notify geladen wird
vim.cmd([[highlight NotifyBackground guibg=#000000]])

require("notify").setup({
    background_colour = "#000000",
    top_down = false,               -- Notifications von unten nach oben
    stages = "fade_in_slide_out",   -- Animation
    render = "compact",             -- Kompakte Darstellung
    timeout = 3000,                 -- 3 Sekunden anzeigen
    max_width = 50,                 -- Maximale Breite
    max_height = 10,                -- Maximale Höhe
    minimum_width = 30,             -- Minimale Breite
    fps = 30,                       -- Animation FPS
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
})

vim.notify = require("notify")

require("noice").setup({
    presets = { 
        command_palette = true,          -- Command-Palette in der Mitte
        long_message_to_split = true,    -- Lange Nachrichten in Split
        inc_rename = false,              -- Kein inc-rename
        lsp_doc_border = true,           -- LSP Doc Border
    },
    cmdline = {
        view = "cmdline_popup",          -- Popup in der Mitte
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
        view = "notify",                 -- Nachrichten über notify (unten rechts)
    },
    notify = {
        enabled = true,
        view = "notify",                 -- Notifications unten rechts
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
})
