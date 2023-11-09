return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function ()
            local lspconfig = require("lspconfig")
            local lsp_defaults = lspconfig.util.default_config

            lsp_defaults.capabilities = vim.tbl_deep_extend(
            "force",
            lsp_defaults.capabilities,
            require("cmp_nvim_lsp").default_capabilities()
            )

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function()
                end
            })

            local default_setup = function (server)
                lspconfig[server].setup({})
            end

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = {default_setup}
            })

            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                },
                mapping = cmp.mapping.preset.insert({
                    -- Enter key confirms completion item
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    -- Ctrl + space triggers completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })

            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                }
            })
        end,
        init = function ()
            vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, { silent = true })
            vim.keymap.set("n", "<S-F6>", vim.lsp.buf.rename)
        end
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
            highlight = true,
            click = true,
            lsp = {
                auto_attach = true,
            }
        },
    },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        dependencies = { "hrsh7th/nvim-cmp", },
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
            require("cmp").config.formatting = {
                format = require("tailwindcss-colorizer-cmp").formatter
            }
        end,
    }
}
