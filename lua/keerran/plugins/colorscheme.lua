return {
    {
        "sainnhe/everforest",
        lazy = true,
    },
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function ()
            vim.g.gruvbox_material_background = "soft"
        end,
    },
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
        end
    },
    {
        "marko-cerovac/material.nvim",
        lazy = true,
    },
    {
        "sainnhe/sonokai",
        lazy = true,
    },
    {
        "tiagovla/tokyodark.nvim",
        lazy = true,
        opts = {
            transparent_background = true,
        }
    }
}
