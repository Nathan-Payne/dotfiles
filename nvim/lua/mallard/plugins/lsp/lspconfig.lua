return {
    "neovim/nvim-lspconfig",
    enabled = not vim.g.vscode,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local function on_attach(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
            vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, opts)
            -- `vim.diagnostic.goto_next/goto_prev()` are deprecated; use jump().
            vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
            vim.keymap.set("n", "<C-SPACE>", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Apply the shared capabilities/on_attach to every server via the native
        -- `vim.lsp.config()` API (the `require('lspconfig')` "framework" is deprecated).
        vim.lsp.config("*", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Per-server overrides.
        vim.lsp.config("graphql", {
            filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
        })

        vim.lsp.config("emmet_ls", {
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        -- Enable the language servers. nvim-lspconfig provides the base configs
        -- (in its lsp/ directory); mason-lspconfig installs the binaries.
        vim.lsp.enable({
            "html",
            "ts_ls",
            "cssls",
            "tailwindcss",
            "prismals",
            "graphql",
            "emmet_ls",
            "gopls",
            "marksman",
            "jsonls",
            "biome",
            "astro",
            "lua_ls",
        })
    end,
}
