return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("nvim-treesitter.configs").setup {
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        scope_incremental = "<S-CR>",
                        node_decremental = "<BS>",
                    }
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
        end
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = {

        }
    }
}
