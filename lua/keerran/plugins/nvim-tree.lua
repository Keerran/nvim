
return {
    "nvim-tree/nvim-tree.lua",
    config = function ()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local api = require("nvim-tree.api")

        local function collapse()
            local node = api.tree.get_node_under_cursor()

            if node.nodes ~= nil and node.open then
                api.node.open.edit()
            end
        end

        local function attach(bufnr)
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.set("n", "l", api.node.open.edit,    opts("Edit Or Open"))
            vim.keymap.set("n", "h", collapse,              opts("Collapse"))
            vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
        end

        require("nvim-tree").setup {
            on_attach = attach,
            sync_root_with_cwd = true,
            hijack_cursor = true,
            select_prompts = true,
            git = {
                enable = true,
                ignore = true,
                timeout = 2000
            },
            filters = {
                custom = {
                    "\\.git$",
                    "\\.vscode$",
                }
            },
            view = {
                preserve_window_proportions = true,
                signcolumn = "yes",
            },
            actions = {
                open_file = {
                    quit_on_open = false,
                },
            },
            renderer = {
                icons = {
                    diagnostics_placement = "after",
                    git_placement = "signcolumn",
                },
                indent_markers = {
                    enable = true
                },
                root_folder_label = ":t",
                group_empty = true,
            },
            diagnostics = {
                enable = true,
            },
        }

        -- fix buffer close
        vim.api.nvim_create_autocmd("BufEnter", {
            nested = true,
            callback = function()
                -- local api = require('nvim-tree.api')

                -- Only 1 window with nvim-tree left: we probably closed a file buffer
                if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
                    -- Required to let the close event complete. An error is thrown without this.
                    vim.defer_fn(function()
                        -- close nvim-tree: will go to the last hidden buffer used before closing
                        api.tree.toggle({find_file = true, focus = true})
                        -- re-open nivm-tree
                        api.tree.toggle({find_file = true, focus = true})
                        -- nvim-tree is still the active window. Go to the previous window.
                        vim.cmd("wincmd p")
                    end, 0)
                end
            end
        })
        map_group("n", "<leader>e", "NvimTree")
        vim.keymap.set("n", "<leader>ee", ":NvimTreeFocus<cr>", {silent = true, noremap = true})
        vim.keymap.set("n", "<leader>ec", ":NvimTreeClose<cr>", {silent = true, noremap = true})
    end
}
