-- plugins/conform.lua
return {
  "stevearc/conform.nvim",
    event = "BufWritePre",
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier" },
      },
    })
    vim.keymap.set("n", "<leader>cf", function() require("conform").format() end, { desc = "Format file" })
  end
}
-- "<leader>cf": Manually format the current buffer.
-- Auto-format runs on save for supported filetypes.
