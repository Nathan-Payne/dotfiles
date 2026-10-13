return {
    'serhez/bento.nvim',
    enabled = not vim.g.vscode,
    config = function()
        require('bento').setup {
            ui = {
                floating = {
                    position = 'top-right',
                },
            },
        }

        local api = require('bento.api')

        api.register_expand_key('<leader>h')
        api.register_last_buffer_key('.')

        api.register_collapse_key('<Esc>')
        api.register_prev_page_key('[')
        api.register_next_page_key(']')

        api.register_action('open', { key = '<CR>', action = api.actions.open, hl = 'DiagnosticVirtualTextHint' })
        api.register_action('delete', { key = '<BS>', action = api.actions.delete, hl = 'DiagnosticVirtualTextError' })
        api.register_action('vsplit', { key = '|', action = api.actions.vsplit, hl = 'DiagnosticVirtualTextInfo' })
        api.register_action('split', { key = '_', action = api.actions.split, hl = 'DiagnosticVirtualTextInfo' })
        api.register_action('lock', { key = '*', action = api.actions.lock, hl = 'DiagnosticVirtualTextWarn' })

        api.set_default_action('open')

        -- bento registers a CursorMoved autocmd that collapses the menu on any
        -- cursor movement. With no minimal menu configured that means the menu
        -- is closed outright, which also drops all the buffer label keymaps --
        -- so nudge the cursor and the labels stop working. Since <Esc> is
        -- registered as the collapse key above, drop the auto-collapse so the
        -- menu stays put until you pick a buffer or dismiss it.
        local ok, autocmds = pcall(vim.api.nvim_get_autocmds, {
            group = 'BentoRefresh',
            event = 'CursorMoved',
        })
        if ok then
            for _, autocmd in ipairs(autocmds) do
                pcall(vim.api.nvim_del_autocmd, autocmd.id)
            end
        end
    end,
}
