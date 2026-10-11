return {
    'nvim-telescope/telescope.nvim',
    enabled = not vim.g.vscode,
    branch = "0.1.x",
    dependencies = {
        'nvim-lua/plenary.nvim',
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    },
    config = function()
        require('telescope').setup {
            defaults = {
                layout_strategy = 'flex',
                layout_config = {
                    height = 0.99,
                    width = 0.80,
                    vertical = {
                        preview_cutoff = 1,
                    },
                    horizontal = {
                        preview_cutoff = 1,
                    },
                },
            },
            pickers = {
                git_status = {
                    theme = "ivy",
                },
                buffers = {
                    theme = "ivy",
                },
                commands = {
                    theme = "ivy",
                },
                colorscheme = {
                    theme = "ivy",
                },
                jumplist = {
                    theme = "ivy",
                },
                lsp_references = {
                    theme = "ivy",
                },
                lsp_implementations = {
                    theme = "ivy",
                },
                treesitter = {
                    theme = "ivy",
                },
            },
        }

        -- Keymaps
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>f..', builtin.builtin, { desc = "All pickers" }) -- all possible pickers picker

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git files" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Grep word under cursor" }) -- search using string under cursor
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Keymaps" })
        vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Commands" }) -- all executable cmds
        vim.keymap.set('n', '<leader>fq', builtin.colorscheme, { desc = "Colorschemes" }) -- colorscheme picker
        vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = "Jumplist" })
        vim.keymap.set('n', '<leader>f.', builtin.highlights, { desc = "Highlight groups" })

        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Diagnostics" })
        vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "LSP references" })
        vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = "LSP implementations" })

        vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Git status" })
        vim.keymap.set('n', '<leader>tr', builtin.treesitter, { desc = "Treesitter symbols" })
    end
}
