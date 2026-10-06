return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                -- Biome owns the JS/TS/React/CSS/JSON toolchain
                javascript = { "biome" },
                javascriptreact = { "biome" },
                typescript = { "biome" },
                typescriptreact = { "biome" },
                css = { "biome" },
                jsonc = { "biome" },
                graphql = { "biome" },
                -- Biome's .astro support is experimental and requires
                -- html.experimentalFullSupportEnabled in the project's
                -- biome.json, so templates stay on prettierd.
                astro = { "prettierd" },
                html = { "prettierd" },
                markdown = { "prettierd" },
                yaml = { "prettierd" },
                -- out of scope, left exactly as-is
                json = { "jq" },
                lua = { "stylua" },
                golang = { "gofumpt" },
            }
        })

        vim.keymap.set({ "n", "v" }, "<C-F>", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 3000,
            })
        end, { desc = "Format buffer" })
    end
}
