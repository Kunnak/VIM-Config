local lspconfig = require('lspconfig')

-- LSP Handler für bessere Floating Windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
  title = "Hover",
  focusable = false,
  focus = false,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
  title = "Signature Help",
  focusable = false,
  focus = false,
  close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
})

-- Globale LSP on_attach Funktion
local function on_attach(client, bufnr)
  -- Highlight-Gruppen für aktuelle Buffer
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
  })
  
  vim.api.nvim_create_autocmd("CursorMoved", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })

  -- Signature help nur bei manueller Anfrage anzeigen (entfernt automatisches CursorHoldI)
  -- Manuelle Aktivierung über Keymap möglich
end

-- TypeScript
lspconfig.ts_ls.setup{
  on_attach = on_attach,
}

lspconfig.jdtls.setup{
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("InsertLeave", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.document_highlight()
        vim.diagnostic.setqflist({open=false})
      end,
    })
  end,
}
lspconfig.html.setup{}
lspconfig.cssls.setup{}

-- Verbesserte LemMinX Konfiguration für UI5 mit lokalen Schemas
lspconfig.lemminx.setup{
  on_attach = on_attach,
  filetypes = { "xml" },
  settings = {
    xml = {
      validation = {
        enabled = true,
        namespaces = {
          enabled = "always"
        },
        schema = {
          enabled = "always"
        }
      },
      completion = {
        autoCloseTags = true,
        autoCloseRemovesContent = false,
      },
      format = {
        enabled = true,
        splitAttributes = true,
        spaceBeforeEmptyCloseTag = true,
      },
      symbols = {
        enabled = true,
        excluded = {}
      },
      codeLens = {
        enabled = true
      }
    }
  }
}

lspconfig.pyright.setup{}
lspconfig.lua_ls.setup({
  settings = { Lua = { diagnostics = { globals = { 'vim' }, }, }, },
})
lspconfig.clangd.setup {
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
}
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    }
  }
})