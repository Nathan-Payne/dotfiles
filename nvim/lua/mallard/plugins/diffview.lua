return {
    'dlyongemallo/diffview-plus.nvim',
    enabled = not vim.g.vscode,
    version = '*',
    dependencies = { 'echasnovski/mini.icons' },
    -- Lazy-load on first use, either via one of the keymaps below or the
    -- commands themselves.
    cmd = {
        'DiffviewOpen',
        'DiffviewClose',
        'DiffviewToggleFiles',
        'DiffviewFocusFiles',
        'DiffviewRefresh',
        'DiffviewFileHistory',
        'DiffviewDiffFiles',
        'DiffviewLog',
    },
    keys = {
        { '<leader>Do', '<cmd>DiffviewOpen<CR>', desc = 'Open diff view' },
        { '<leader>Dh', '<cmd>DiffviewFileHistory %<CR>', desc = 'File history' },
        { '<leader>De', '<cmd>DiffviewToggleFiles<CR>', desc = 'Toggle file panel' },
        { '<leader>Dr', '<cmd>DiffviewRefresh<CR>', desc = 'Refresh' },
        { '<leader>Dx', '<cmd>DiffviewClose<CR>', desc = 'Close diffview' },
    },
    config = function()
        require('diffview').setup {
            enhanced_diff_hl = true,
            use_icons = true, -- mini.icons is installed
            view = {
                default = { layout = 'diff2_horizontal' },
                merge_tool = { layout = 'diff3_horizontal' },
            },
            file_panel = {
                listing_style = 'tree',
                win_config = { position = 'left', width = 35 },
            },
        }
    end,
}
