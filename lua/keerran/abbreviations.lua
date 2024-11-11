local abbreviations = {
    W = "w",
    Q = "q",
    E = "e",
    Qa = "qa",
    Wq = "wq",
    Wqa = "wqa",
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
    vim.keymap.set("ca", lhs, function ()
        return vim.fn.getcmdtype() == ":" and vim.fn.getcmdline() == lhs and rhs or lhs
    end, { noremap = true, expr = true })
end
