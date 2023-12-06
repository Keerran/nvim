local abbreviations = {
    W = "w",
    Q = "q",
    Wq = "wq",
    E = "e",
    Ngit = "Neogit",
    ngit = "Neogit",
    Norg = "Neorg",
    norg = "Neorg",
    Org = "Neorg",
    org = "Neorg",
    git = "Git",
    lazy = "Lazy",
}

for lhs, rhs in pairs(abbreviations) do
    vim.cmd.cnoreabbrev(("%s %s"):format(lhs, rhs))
end
