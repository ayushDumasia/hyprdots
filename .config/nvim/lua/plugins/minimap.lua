return  {
  "wfxr/minimap.vim",
  requires = {
    "wfxr/code-minimap", -- Dependency for the minimap
  },
  run = "cargo install --locked code-minimap", -- Install the code-minimap dependency
  config = function()
    vim.cmd("let g:minimap_width = 40") -- Example of setting up the minimap width
    vim.cmd("let g:minimap_auto_start = 1") -- Automatically start the minimap
    vim.cmd("let g:minimap_auto_start_win_enter = 1") -- Automatically start minimap on window enter
  end,
}

