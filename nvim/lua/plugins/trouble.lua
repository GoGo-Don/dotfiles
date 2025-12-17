-- plugins/trouble.lua
return {
  "folke/trouble.nvim",
    event = "BufRead",
    config = function()
        require("trouble").setup({})
        vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble" })
        vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
        vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Document Diagnostics" })
        vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Quickfix List" })
        vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Location List" })
    end
}
-- "<leader>xx": Show/hide Trouble diagnostic panel.
-- "<leader>xw"/"<leader>xd": Show workspace/document diagnostics.
-- "<leader>xq": Show quickfix panel.
-- "<leader>xl": Show location list.
