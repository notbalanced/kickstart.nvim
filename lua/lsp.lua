
vim.lsp.config ('lua_ls', {
    settings = {
        Lua = {
            diagnostics = { globals = {'vim'}}
        }
    }
})
vim.lsp.enable('lua_ls')

vim.lsp.config('yamlls', {})
vim.lsp.enable('yamlls')

vim.lsp.config('clangd', {
    cmd = {"clangd", "--background-index", "--clang-tidy" },
})
vim.lsp.enable('clang')

