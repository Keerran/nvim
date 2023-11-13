return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "SmiteshP/nvim-navic",
    },
    opts = {
        options = {
            theme = "auto",
            globalstatus = true,
        },
        winbar = {
            lualine_c = {
                {
                    "navic",
                    color_correction = nil,
                    navic_opts = nil
                }
            }
        }
    },
    config = true,
}
