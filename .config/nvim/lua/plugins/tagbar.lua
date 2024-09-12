return {
    "preservim/tagbar",
    --dependencies = { "ctags" }, -- Note: `ctags` is not a Neovim plugin; it's a system dependency
    config = function()
        -- Set up Tagbar key mapping
        vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
    end,
}

