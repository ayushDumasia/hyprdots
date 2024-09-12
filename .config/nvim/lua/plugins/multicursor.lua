return {

  "smoka7/multicursors.nvim",
  config = function()
    require("lazy").setup({
      config = function()
        config.setup({})

        -- Set up key mappings for Ctrl + Shift + Arrow Keys
        vim.api.nvim_set_keymap("n", "<C-S-Left>", "<cmd>MCstart<cr>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<C-S-Right>", "<cmd>MCnext<cr>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<C-S-Up>", "<cmd>MCprev<cr>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<C-S-Down>", "<cmd>MCexit<cr>", { noremap = true, silent = true })
      end,
    })
  end,
}
