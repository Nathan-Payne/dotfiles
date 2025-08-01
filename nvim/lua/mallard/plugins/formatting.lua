return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "biome" },
                typescript = { "biome" },
                javascriptreact = { "biome" },
                typescriptreact = { "biome" },
                css = { "biome" },
                html = { "prettierd" },
                json = { "jq" },
                yaml = { "prettierd" },
                markdown = { "prettierd" },
                graphql = { "biome" },
                lua = { "stylua" },
                golang = { "gofumpt" },
                astro = { "prettierd" },
            }
        })

        vim.keymap.set({ "n", "v" }, "<C-F>", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end
        )
    end
}
