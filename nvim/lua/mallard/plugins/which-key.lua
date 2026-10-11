return {
    "folke/which-key.nvim",
    enabled = not vim.g.vscode,
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local wk = require("which-key")
        local icons = require("mini.icons")

        local function icon(category, name)
            local glyph, hl = icons.get(category, name)
            return { icon = glyph, hl = hl }
        end

        wk.setup({
            win = {
                col = -2, -- 2 columns from the right edge
                row = -2, -- 2 rows above the cmdline
                border = "none",
                no_overlap = false,
                -- Cap the popup width. Without a max it lays out one column at
                -- full screen width as soon as a description is long enough.
                width = { min = 20, max = 60 },
                padding = { 1, 2 },
            },
        })

        wk.add({
            { "<leader>d", group = "Diagnostic", icon = icon("lsp", "Event") },
            { "<leader>f", group = "Find", icon = icon("lsp", "file") },
            { "<leader>g", group = "Git", icon = icon("filetype", "git") },
            
            { "<leader>r", group = "Refactor", icon = icon("lsp", "reference") },
            { "<leader>n", group = "Swap next", icon = icon("lsp", "operator") },
            { "<leader>p", group = "Swap previous", icon = icon("lsp", "operator") },
        })
    end,
}
