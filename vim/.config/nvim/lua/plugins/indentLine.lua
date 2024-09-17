return {
  'Yggdroot/indentLine',
  config = function()
    -- Set the character used for indentation lines
    vim.g.indentLine_char = '│'

    -- Optional: Set colors for terminal and GUI
    vim.g.indentLine_color_term = 239
    vim.g.indentLine_color_gui = '#3e4451'

    -- Optional: Customize the behavior of indentLine
    -- Enable/disable specific file types or settings if needed
    vim.g.indentLine_filetype_exclude = {"*"}
  end
}

