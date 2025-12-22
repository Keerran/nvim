local abbreviations = {
    W = "w",
    Q = "q",
    E = "e",
    Qa = "qa",
    Wq = "wq",
    Wqa = "wqa",
    Norg = "Neorg",
    norg = "Neorg",
    git = "Git",
    lazy = "Lazy",
    mason = "Mason",
    config = "Config",
}

for lhs, rhs in pairs(abbreviations) do
    vim.keymap.set("ca", lhs, function ()
        if vim.fn.getcmdtype() == ":" and vim.fn.getcmdline() == lhs then
            return rhs
        else
            return lhs
        end
    end, { noremap = true, expr = true })
end
