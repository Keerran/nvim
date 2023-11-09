return {
    "sainnhe/everforest",
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function ()
            vim.opt.background = "dark"
            vim.g.gruvbox_material_background = "soft"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    }
}
