local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
    local function get_table_size(t)
        local count = 0
        for _ in pairs(t) do
            count = count + 1
        end
        return count
    end

    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = get_table_size(picker:get_multi_selection())

    if num_selections > 1 then
        actions.send_selected_to_qflist(prompt_bufnr)
        actions.open_qflist()
    else
        actions.file_edit(prompt_bufnr)
    end
end

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["<cr>"] = custom_actions.fzf_multi_select,
            },
        },
    },
})
