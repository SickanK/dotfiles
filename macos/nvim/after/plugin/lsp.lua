local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'pylsp',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['tsserver'] = {},
        ['pylsp'] = { 'python' },
    }
})

lsp.setup()

-- custom cmp

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-m>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
            fallback()
        end
    end),
})


require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
})


cmp.setup({
    sources = {
        { name = "copilot",  group_index = 2 },
        { name = 'path',     group_index = 2 },
        { name = 'nvim_lsp', group_index = 2 },
        --[[
            { name = 'buffer',         keyword_length = 3 },
            { name = 'luasnip',        keyword_length = 2 },
             ]] --

    },
    mapping = cmp_mappings
})

cmp.setup.filetype("css", {
    sources = {
        { name = "copilot",        group_index = 2 },
        { name = "css-properties", keyword_length = 2, group_index = 0 },
        { name = 'nvim_lsp',       group_index = 2 },
        { name = 'path',           group_index = 2 },
    },
    sorting = {
        comparators = {
            cmp.config.compare.score,
        }
    },
    mapping = cmp_mappings
})

vim.diagnostic.config({
    virtual_text = true
})
