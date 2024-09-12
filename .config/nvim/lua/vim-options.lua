
-- Set basic indentation options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.number = true
--vim.keymap.set("n", "<C-c>", '"+y', { noremap = true, silent = true })

--vim.keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true })

vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

vim.keymap.set("n", "<C-t>", ":vsp<CR>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<C-w>", ":tabclose<CR>", { noremap = true, silent = true })

