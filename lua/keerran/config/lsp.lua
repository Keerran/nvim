local lsps = {
    "lua_ls",
    "ty",
    "rust_analyzer",
    "nil_ls",
}

for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
end
