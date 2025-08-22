return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        opts = {
            transparent_background = true,
        },
        init = function ()
            vim.opt.background = "dark"
            vim.cmd.colorscheme("catppuccin")
        end
    },
}
