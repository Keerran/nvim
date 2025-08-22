return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                },
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["as"] = { query = "@scope", query_group = "locals" },
                        }
                    },
                    move = {
                        enable = true,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]s"] = { query = "@scope", query_group = "locals" },
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[s"] = { query = "@scope", query_group = "locals" },
                        }
                    }
                }
            }
        end,
    }
}
