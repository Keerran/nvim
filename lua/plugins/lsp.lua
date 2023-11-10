return {
    {
        "neovim/nvim-lspconfig",
        init = function ()
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
            vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, { silent = true })
            vim.keymap.set("n", "<S-F6>", vim.lsp.buf.rename)
        end
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig"
        },
        config = function ()
            local lspconfig = require("lspconfig")
            local default_setup = function (server)
                lspconfig[server].setup({})
            end

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = {
                    default_setup,
                    lua_ls = function ()
                        require("lspconfig").lua_ls.setup({
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

                    end
                }
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
        },
        config = function ()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                },
                mapping = cmp.mapping.preset.insert({
                    -- Enter key confirms completion item
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                    ['<TAB>'] = cmp.mapping.confirm({select = false}),
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
                formatting = {
                    format = require("tailwindcss-colorizer-cmp").formatter
                },
                completion = {
                    completeopt = "menu,preview"
                }
            })
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
}
