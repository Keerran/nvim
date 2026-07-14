local lsps = {
    "lua_ls",
    "ty",
    "rust_analyzer",
    "gdscript",
    "nil_ls",
    "ruff",
    "terraformls",
    "lemminx",
    "jsonls",
    "ts_ls",
    "clangd"
}

for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
end
