return {
    "psliwka/vim-smoothie",
    config = function()
        vim.api.nvim_set_keymap('n', '<C-u>', '<Plug>(SmoothieUpwards)', {})
        vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(SmoothieDownwards)', {})
        vim.api.nvim_set_keymap('n', '<C-b>', '<Plug>(SmoothieUpwards)', {})
        vim.api.nvim_set_keymap('n', '<C-f>', '<Plug>(SmoothieDownwards)', {})
    end,
}

