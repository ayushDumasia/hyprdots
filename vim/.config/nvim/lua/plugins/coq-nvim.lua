return {
  "ms-jpq/coq_nvim",
  branch = "coq",
  run = ":COQdeps", -- Installs required dependencies
  config = function()
    -- Load the coq plugin
    require("coq")()

    -- Optional: Load the recommended plugins for better completion experience
    require("coq")({
      { src = "nvimlua", short_name = "nLUA", conf_only = false }, -- For Neovim Lua API
      { src = "bc",      short_name = "MATH", precision = 6 },  -- For mathematical calculations
      { src = "cow",     trigger = "!cow" },                    -- For ASCII cows
      { src = "figlet",  trigger = "!big" },                    -- For ASCII art
    })
  end,
}
