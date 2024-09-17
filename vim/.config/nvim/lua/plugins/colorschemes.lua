return {
  -- 	-- Catppuccin theme

  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000, -- Adjusted priority
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
  -- },

  -- 	-- Onedarkpro theme
  --
  -- 		-- "olimorris/onedarkpro.nvim",
  -- 		-- priority = 1000, -- Ensure it loads first
  -- 		-- config = function()
  -- 		-- 	vim.cmd.colorscheme('onedark')
  -- 		-- end
  --
  -- 	-- Gotham theme
  -- 	-- {
  -- 	-- 	"whatyouhide/vim-gotham",
  -- 	-- 	priority = 800, -- Adjusted priority
  -- 	-- 	lazy = false,
  -- 	-- 	-- No config, we are not applying this theme by default
  -- 	-- },
  --
  -- 	-- -- Dracula theme
  -- 	-- {
  -- 	-- 	"dracula/vim",
  -- 	-- 	priority = 200, -- Highest priority, loads this theme last
  -- 	-- 	config = function()
  -- 	-- 		vim.cmd.colorscheme("dracula") -- Apply Dracula as the default theme
  -- 	-- 	end,
  --
  -- 	-- },
}
