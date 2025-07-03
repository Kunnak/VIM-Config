local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
                indent = { enable = true },
            })
            end,
    },


    -- Theme
    { "ellisonleao/gruvbox.nvim",
            priority = 1000
    },



    -- Mason
    { "mason-org/mason.nvim",
            opts = {}
    },



    -- LSP-Config
    { "neovim/nvim-lspconfig"
    },



    -- Inline Diagnostic
    { "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require('tiny-inline-diagnostic').setup({
                preset = "modern",
                transparent_bg = false,
                transparent_cursorline = false,
                signs = {
                left = "",
                right = "",
                diag = "",
                arrow = "    ",
                up_arrow = "    ",
                vertical = " │",
                vertical_end = " └",
                },
                hi = {
                    error = "DiagnosticError",
                    warn = "DiagnosticWarn",
                    info = "DiagnosticInfo",
                    hint = "DiagnosticHint",
                    arrow = "NonText",
                    background = "CursorLine",
                    -- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
                    mixing_color = "None",
                },

                options = {
        	        show_source = {
        	        enabled = false,
        	        if_many = false,
        	        },
                use_icons_from_diagnostic = false,
                set_arrow_to_diag_color = false,
                add_messages = true,
                throttle = 20,
                softwrap = 30,
                multilines = {
                    enabled = true,
                    always_show = true,
                },
                show_all_diags_on_cursorline = true,
                -- Enable diagnostics in Insert mode
                enable_on_insert = false,
        	      -- Enable diagnostics in Select mode (e.g when auto inserting with Blink)
                enable_on_select = false,
                overflow = {
                    -- "wrap" - Split long messages into multiple lines
                    -- "none" - Do not truncate messages
                    -- "oneline" - Keep the message on a single line, even if it's long
                    mode = "wrap",
                    padding = 0,
                },
                break_line = {
                    enabled = false,
                    after = 30,
                },
                -- Custom format function for diagnostic messages
                -- Example:
                -- format = function(diagnostic)
                --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
                -- end
                format = nil,
                virt_texts = {
                    priority = 2048,
                },
                severity = {
                    vim.diagnostic.severity.ERROR,
                    vim.diagnostic.severity.WARN,
                    vim.diagnostic.severity.INFO,
                    vim.diagnostic.severity.HINT,
                },
                overwrite_events = nil,
                },
                disabled_ft = {},
                blend = {
                    factor = 0.22,
                }, })
                vim.diagnostic.config({ virtual_text = true })
        end
    },


    --- LSP-Config
    { 'neovim/nvim-lspconfig'
    },


    -- Blink
    { "saghen/blink.cmp",
      dependencies = { 'rafamadriz/friendly-snippets' },
      version = '1.*',
      opts = {
        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = "mono",
        },
        completion = {
          accept = {
            auto_brackets = { enabled = true },
          },
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        keymap = {
          preset = "enter",
          ['<TAB>'] = { 'select_next', 'fallback' },
          ['<S-TAB>'] = { 'select_prev', 'fallback' },
          ['<C-ENTER>'] = { function(cmp) cmp.complete() end,
          },
        },
        fuzzy = {
          implementation = "prefer_rust_with_warning",
        },
      },
      },



    --- CMP-Stuff
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },



    -- Telescope
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' },
    },



    -- Noice.nvim
    { 'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = {
            'MunifTanjim/nui.nvim',
            "rcarriga/nvim-notify"
        },
        config = function()
            require("noice").setup()
        end,
    },

    -- LuaLine
    { 'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'auto', -- oder z.B. 'gruvbox', 'tokyonight', etc.
                },
            }
        end,
    },

    --
    --
    -- Weitere Plugins hier hinzufügen
})
