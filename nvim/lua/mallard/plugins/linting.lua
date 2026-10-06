return {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "biomejs" },
            javascriptreact = { "biomejs" },
            typescript = { "biomejs" },
            typescriptreact = { "biomejs" },
            astro = { "biomejs" },
            css = { "biomejs" },
            jsonc = { "biomejs" },
        }

        -- The Biome LSP is the primary diagnostic source. It only attaches
        -- when the project has a biome.json, so when it is absent we fall
        -- back to running the CLI. This is what removes the duplicate
        -- squiggles while keeping nvim-lint useful.
        local function try_lint()
            if #vim.lsp.get_clients({ bufnr = 0, name = "biome" }) == 0 then
                lint.try_lint()
            end
        end

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = try_lint,
        })

        vim.keymap.set("n", "<leader>l", function()
            -- Force a run even when the LSP is attached.
            lint.try_lint()
        end, { desc = "Lint buffer" })
    end
}
