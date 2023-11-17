local abbreviations = {
    W = "w",
    Q = "q",
    Wq = "wq",
}

for lhs, rhs in pairs(abbreviations) do
    vim.cmd.cnoreabbrev(("%s %s"):format(lhs, rhs))
end
