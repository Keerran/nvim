return {
    {
        "neovim/nvim-lspconfig",
        init = function()
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
                    vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, { silent = true })
                    vim.keymap.set("n", "<S-F6>", vim.lsp.buf.rename)
                    vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "Go to definition" })
                    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Open hover hint" })
                    vim.keymap.set("n", "<leader>l", vim.lsp.buf.format, { desc = "Format file" })
                    vim.keymap.set("n", "gH", vim.diagnostic.open_float, { desc = "Open diagnostic" })
                end
            })
        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig"
        },
        config = function()
            local lspconfig = require("lspconfig")
            local default_setup = function(server)
                vim.lsp.config(server, {})
            end
            vim.lsp.config("qmlls", {
                cmd = { "qmlls" },
            })
            vim.lsp.config("nushell", {})

            local util = require('lspconfig/util')

            local path = util.path

            local function get_python_path(workspace)
                -- Use activated virtualenv.
                if vim.env.VIRTUAL_ENV then
                    return path.join(vim.env.VIRTUAL_ENV, 'Scripts', 'python.exe')
                end

                -- Find and use virtualenv from pipenv in workspace directory.
                local match = vim.fn.glob(path.join(workspace, '.venv'))
                if match ~= '' then
                    return path.join(workspace, '.venv', 'Scripts', "python.exe")
                end

                match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
                if match ~= '' then
                    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
                    return path.join(venv, 'Scripts', 'python.exe')
                end

                -- Fallback to system Python.
                return nil
            end

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = {
                    default_setup,
                    pylsp = function ()
                        vim.lsp.config("pylsp", {
                            before_init = function (_, config)
                                local pythonPath = get_python_path(config.root_dir)
                                config.settings.pylsp = vim.tbl_deep_extend("force", config.settings.pylsp, {
                                    plugins = {
                                        jedi = {
                                            environment = pythonPath
                                        }
                                    }
                                })
                            end,
                            settings = {
                                pylsp = {
                                    pylsp = {
                                        plugins = {
                                            rope_autoimport = {
                                                enabled = true
                                            },
                                            flake8 = {
                                                enabled = false,
                                                ignore = { "E501", "W503" },
                                            },
                                            pyflakes = {
                                                enabled = false
                                            }
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
            "hrsh7th/cmp-emoji",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = "neorg" },
                    { name = "emoji" },
                },
                mapping = cmp.mapping.preset.insert({
                    -- Enter key confirms completion item
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<TAB>'] = cmp.mapping.confirm({ select = false }),
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
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
    }
}
