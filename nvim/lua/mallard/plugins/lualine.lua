return {
    'nvim-lualine/lualine.nvim',
    enabled = not vim.g.vscode,
    config = function()
        require("lualine").setup {
            theme = "catppuccin",
            options = {
                icons_enabled = false,
                section_separators = '',
                component_separators = '',
                theme = {
                    normal = {
                        a = { fg = '#dddddd', bg = '#202020' },
                        b = { fg = '#dddddd', bg = '#202020' },
                        c = { fg = '#dddddd', bg = '#202020' },
                    },
                    insert = {
                        a = { fg = '#202020', bg = '#ABE9B3' },
                        b = { fg = '#dddddd', bg = '#202020' },
                        c = { fg = '#dddddd', bg = '#202020' },
                        z = { fg = '#dddddd', bg = '#202020' },
                    },
                    visual = {
                        a = { fg = '#202020', bg = '#C9CBFF' },
                        b = { fg = '#dddddd', bg = '#202020' },
                        c = { fg = '#dddddd', bg = '#202020' },
                        z = { fg = '#dddddd', bg = '#202020' },
                    },
                    command = {
                        a = { fg = '#202020', bg = '#F8BD96' },
                        b = { fg = '#dddddd', bg = '#202020' },
                        c = { fg = '#dddddd', bg = '#202020' },
                        z = { fg = '#dddddd', bg = '#202020' },
                    },
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
                lualine_c = { "require'lsp-status'.status()" },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
        }
    end
}
