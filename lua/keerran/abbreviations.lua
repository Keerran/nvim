local abbreviations = {
    W = "w",
    Q = "q",
    Wq = "wq",
    Ngit = "Neogit",
    ngit = "Neogit",
    Norg = "Neorg",
    norg = "Neorg",
    Org = "Neorg",
    org = "Neorg",
    git = "Git",
}

for lhs, rhs in pairs(abbreviations) do
    vim.cmd.cnoreabbrev(("%s %s"):format(lhs, rhs))
end
