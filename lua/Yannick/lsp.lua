local lspconfig = require('lspconfig')

lspconfig.tsserver.setup{}
lspconfig.jdtls.setup{}
lspconfig.html.setup{}
lspconfig.cssls.setup{}
lspconfig.lemminx.setup{}
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
