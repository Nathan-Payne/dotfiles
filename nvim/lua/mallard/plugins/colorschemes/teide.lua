return {
    "serhez/teide.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        -- Bare `:colorscheme teide` resolves to the darkest style. The other
        -- variants remain selectable: teide-dark, teide-dimmed, teide-light.
        style = "darker",
        terminal_colors = true,
        plugins = {
            auto = true,
            telescope = true,
            mini_icons = true, -- inert until mini.nvim/mini.icons is installed
            leap = true,
            lazy = true,
            alpha = true,
        },
    },
}
