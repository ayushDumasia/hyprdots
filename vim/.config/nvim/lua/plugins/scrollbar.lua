return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "kevinhwang91/nvim-hlslens", -- Optional, for better search highlighting
  },
  config = function()
    require("scrollbar").setup({
      handle = {
        color = "#4C566A", -- Custom color for the scrollbar handle
      },
      marks = {
        Search = { color = "#EBCB8B" }, -- Color for search results
        Error = { color = "#BF616A" },  -- Color for errors
        Warn = { color = "#EBCB8B" },   -- Color for warnings
        Info = { color = "#88C0D0" },   -- Color for info
        Hint = { color = "#A3BE8C" },   -- Color for hints
        Misc = { color = "#D08770" },   -- Color for miscellaneous markers
      },
      handlers = {
        cursor = true,  -- Enable scrollbar on cursor
        diagnostic = true, -- Show diagnostics in the scrollbar
        search = true,  -- Highlight search results in the scrollbar
      },
    })

    -- Optional: Integrate with hlslens for better search highlighting
    require("scrollbar.handlers.search").setup({
      override_lens = function(render, posList, nearest, idx, relIdx)
        local sfw = vim.v.searchforward == 1
        local indicator, text, chunks
        local absRelIdx = math.abs(relIdx)
        if absRelIdx > 1 then
          indicator = string.format("%d%s", absRelIdx, sfw ~= (relIdx > 1) and "↑" or "↓")
        elseif absRelIdx == 1 then
          indicator = sfw ~= (relIdx == 1) and "↑" or "↓"
        else
          indicator = ""
        end

        local lnum, col = unpack(posList[idx])
        if nearest then
          local cnt = #posList
          text = string.format("[%s %d/%d]", indicator, idx, cnt)
          chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
        else
          text = string.format("[%s %d]", indicator, idx)
          chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
        end
        render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
      end,
    })
  end,
}

