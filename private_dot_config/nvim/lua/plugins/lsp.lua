require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "ty",
        "clangd",
        "rust_analyzer",
    },
})

vim.lsp.enable({
    "lua_ls",
    "ty",
    "clangd",
    "rust_analyzer",
})
