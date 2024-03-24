local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "volar", "tailwindcss", "phpactor", "twiggy_language_server", "astro", "tsserver" }

lspconfig.volar.setup{
  filetypes = {"javascriptreact", "typescriptreact", "vue", "json"}
}

lspconfig.phpactor.setup{
  filetypes = {"php"}
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
