return {
    "https://codeberg.org/andyg/leap.nvim",
    config = function()
        require("leap").setup({})
        vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", { desc = "Leap forward to" })
        vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap backward to" })
    end
}
