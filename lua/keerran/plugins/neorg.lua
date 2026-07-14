return {
    "nvim-neorg/neorg",
    enabled = false,
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.completion"] = {
                config = {
                    engine = "nvim-cmp",
                }
            },
            ["core.summary"] = {},
            ["core.promo"] = {},
            ["core.keybinds"] = {},
            ["core.esupports.metagen"] = {},
            ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "/mnt/shared/notes",
                        work = "/mnt/shared/Work/notes"
                    },
                },
            },
            ["core.integrations.nvim-cmp"] = {},
        }
    },
}
