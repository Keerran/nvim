return {
    "tpope/vim-fugitive",
    {
        "NeogitOrg/neogit",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
        },
        opts = {
            disable_hint = true,
            mappings = {
                status = {
                    ["l"] = "Toggle"
                },
                popup = {
                    ["l"] = false,
                }
            }
        },
        init = function ()
            vim.api.nvim_create_user_command(
                "Ngit",
                "Neogit",
                {}
            )
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            on_attach = function (bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, {expr=true, desc = "Next hunk"})

                map('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, {expr=true, desc = "Prev hunk"})

                -- Actions
                map_group({ 'n', 'v' }, "<leader>h", "Git staging")
                map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk" })
                map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset hunk" })
                map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
                map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
                map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage buffer" })
                map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Unstage hunk" })
                map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset buffer" })
                map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
                map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Blame line" })
                map('n', '<leader>hd', gs.diffthis, { desc = "Diff" })
                map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff file" })
            end
        },
        init = function ()
            vim.opt.signcolumn = "yes"
        end
    }
}
