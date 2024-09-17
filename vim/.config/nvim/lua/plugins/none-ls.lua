return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        --null_ls.builtins.diagnostics.asp_grep,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.cpplint,
        null_ls.builtins.formatting.clang_format,
      },
    })

    -- Map <leader>gf to format buffer using null-ls
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format()
    end, { noremap = true, silent = true })
  end,
}
