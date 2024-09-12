return {
	"tommcdo/vim-lion",
	config = function()
		-- Example: Custom keybinding for alignment
		vim.api.nvim_set_keymap("n", "gl", "<Plug>(LionAlign)", {})
		vim.api.nvim_set_keymap("x", "gl", "<Plug>(LionAlign)", {})
		vim.api.nvim_set_keymap("n", "gL", "<Plug>(LionAlign)", {})
		vim.api.nvim_set_keymap("x", "gL", "<Plug>(LionAlign)", {})
	end,
}
