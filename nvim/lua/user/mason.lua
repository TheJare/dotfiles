require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "ruby_lsp" },
}
require'lspconfig'.ruby_lsp.setup{}