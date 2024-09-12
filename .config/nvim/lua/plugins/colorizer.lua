return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*", -- Highlight all files
		}, {
			RGB = true,       -- Enable #RGB hex codes
			RRGGBB = true,    -- Enable #RRGGBB hex codes
			names = true,     -- Enable color names like "blue"
			RRGGBBAA = true,  -- Enable #RRGGBBAA hex codes
			rgb_fn = true,    -- Enable CSS rgb() and rgba() functions
			hsl_fn = true,    -- Enable CSS hsl() and hsla() functions
			css = true,       -- Enable all CSS features
			css_fn = true,    -- Enable all CSS functions
			-- Enabling additional formats
			hsl = true,       -- Enable HSL color codes
			hex = true,       -- Enable hex codes (#000000)
			hsv_fn = true,    -- Enable HSV functions
			hsla_fn = true,   -- Enable HSLA functions
			vim_colors = true, -- Enable Vim color names
			mode = "background", -- Set the display mode to 'background'
		})
	end,
}

