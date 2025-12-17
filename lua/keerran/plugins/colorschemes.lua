return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        opts = {
            transparent_background = true,
            integrations = {
                navic = {
                    enabled = true,
                }
            }
        },
        init = function ()
            vim.opt.background = "dark"
            vim.cmd.colorscheme("catppuccin")
            local groups = { "NormalFloat", "FloatBorder", "FloatTitle", "FloatFooter" }
            for _, group in ipairs(groups) do
                vim.cmd([[hi ]] .. group .. [[ guibg=NONE]])
            end
        end
    },
}
