return {
  "numToStr/Comment.nvim",
  config = function()
    require('Comment').setup({
      -- Add any configuration options here
      toggler = {
        line = 'gcc',  -- Toggle comment for the current line
        block = 'gbc', -- Toggle comment for a block of code
      },
      opleader = {
        line = 'gc',   -- Operator-pending mode mapping for line comments
        block = 'gb',  -- Operator-pending mode mapping for block comments
      },
      mappings = {
        basic = true,  -- Includes basic mappings like `gcc`, `gbc`, `gc[count]{motion}`, and `gb[count]{motion}`
        extra = true,  -- Includes extra mappings like `gco`, `gcO`, `gcA`
        extended = false, -- Includes extended mappings like `g>[count]{motion}`, `g<[count]{motion}`
      },
      pre_hook = nil,  -- Function to call before commenting, useful for languages like TypeScript where you want to check the file type
      post_hook = nil, -- Function to call after commenting
    })
  end,
}

