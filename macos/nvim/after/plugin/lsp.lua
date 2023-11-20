local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
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

local lsp_configurations = require('lspconfig.configs')

if not lsp_configurations.pylsp then
    lsp_configurations.pylsp = {
        default_config = {
            name = 'pylsp',
            cmd = { 'pylsp' },
            filetypes = { 'python' },
            root_dir = require('lspconfig.util').root_pattern(".git", 'pyproject.toml', 'setup.py', 'setup.cfg',
                'requirements.txt', 'Pipfile'),
        }
    }
end

require('lspconfig').pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                mypy = {
                    enabled = true,
                    live_mode = true
                },
                ruff = {
                    enabled = false,
                },
                flake8 = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
            },
        },
    },
}

if not lsp_configurations.ruff_lsp then
    lsp_configurations.ruff_lsp = {
        default_config = {
            name = 'ruff-lsp',
            cmd = { 'ruff-lsp' },
            filetypes = { 'python' },
            root_dir = require('lspconfig.util').root_pattern(".git", 'pyproject.toml', 'setup.py', 'setup.cfg',
                'requirements.txt', 'Pipfile'),
            single_file_support = true,
        }
    }
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,

        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require('lspconfig').ruff_lsp.setup({
    on_attach = on_attach,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    }
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['tsserver'] = {},
        ['ruff-lsp'] = { 'python' },
        ['taplo'] = { 'toml' },
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
