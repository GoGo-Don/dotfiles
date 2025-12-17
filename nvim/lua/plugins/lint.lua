-- plugins/lint.lua
return {
  "mfussenegger/nvim-lint",

    event = { "BufRead", "BufNewFile" },
  config = function()
    require("lint").linters_by_ft = {
      python = { "flake8" },
      lua = { "luacheck" },
      javascript = { "eslint" },
    }
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        require("lint").try_lint()
      end
    })
    vim.keymap.set("n", "<leader>cl", function() require("lint").try_lint() end, { desc = "Lint current file" })
  end
}
-- "<leader>cl": Lint the current buffer.
-- Lint runs automatically after buffer is written.
