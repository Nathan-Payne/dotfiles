return {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        -- Bare `:colorscheme kanso` resolves to the darkest dark variant; the
        -- others remain selectable: kanso-ink, kanso-mist, kanso-pearl.
        background = { dark = "zen" }, -- light stays "pearl"
        bold = true,
        italics = true,
        undercurl = true,
    },
}
