return {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function()
        local lint = require("lint")

        -- nvim-lint's bundled biomejs parser targets Biome 1.x, which marked
        -- findings with "✖". Biome 2.x emits "!" instead, so the upstream
        -- parser matches nothing and every run reports zero diagnostics.
        -- Override it to parse Biome's JSON reporter instead.
        lint.linters.biomejs = {
            cmd = function()
                local local_binary = vim.fn.fnamemodify("./node_modules/.bin/biome", ":p")
                return vim.fn.filereadable(local_binary) == 1 and local_binary or "biome"
            end,
            args = { "lint", "--reporter=json" },
            stdin = false,
            -- The "experimental reporter" notice goes to stderr; JSON is stdout.
            stream = "stdout",
            -- Biome exits 0 even when it reports errors.
            ignore_exitcode = true,
            parser = function(output)
                local ok, res = pcall(vim.json.decode, output)
                if not ok or type(res) ~= "table" then
                    return {}
                end

                local severity = {
                    error = vim.diagnostic.severity.ERROR,
                    warning = vim.diagnostic.severity.WARN,
                    information = vim.diagnostic.severity.INFO,
                    hint = vim.diagnostic.severity.HINT,
                }

                local diags = {}
                -- `res.diagnostics` can be vim.NIL, which is truthy in Lua.
                local items = type(res.diagnostics) == "table" and res.diagnostics or {}
                for _, d in ipairs(items) do
                    local start = d.location and d.location.start
                    if start then
                        table.insert(diags, {
                            lnum = start.line,
                            col = start.column,
                            message = d.message,
                            code = d.category,
                            severity = severity[d.severity] or vim.diagnostic.severity.WARN,
                            source = "biomejs",
                        })
                    end
                end
                return diags
            end,
        }

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
