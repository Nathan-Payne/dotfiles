return {
    "stevedylandev/darkmatter-nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- darkmatter's setup() applies the theme, which would fight the startup
        -- scheme. with_config() only stores options, and they are inherited when
        -- `:colorscheme darkmatter` runs later.
        require("darkmatter-colorscheme").with_config({
            telescope = true,
            telescope_borders = false,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "darkmatter",
            callback = function()
                local fg = "#c1c1c1"
                for _, group in ipairs({
                    "@punctuation.delimiter",
                    "@punctuation.special",
                    "@tag.delimiter",
                    "Delimiter",
                }) do
                    vim.api.nvim_set_hl(0, group, { fg = fg })
                end

                -- Line numbers: midway between comments (base03 #333333) and
                -- normal text (base05 #c1c1c1) -> #7a7a7a. CursorLineNr is left
                -- brighter so the current line still stands out.
                for _, group in ipairs({ "LineNr", "LineNrAbove", "LineNrBelow" }) do
                    vim.api.nvim_set_hl(0, group, { fg = "#7a7a7a", bg = "#121113" })
                end
            end,
        })
    end,
}
