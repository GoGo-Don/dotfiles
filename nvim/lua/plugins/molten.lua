return {

  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  dependencies = { "willothy/wezterm.nvim" },
  init = function()
    vim.g.molten_auto_open_output = false   -- must be false with wezterm provider
    vim.g.molten_output_show_more = true
    vim.g.molten_image_provider = "wezterm"
    vim.g.molten_output_virt_lines = true
  end,

  config = function()
    ------------------------------------------------------------------
    -- Keybinds
    ------------------------------------------------------------------
    vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>",
        { silent = true, desc = "Initialize the plugin" })
    vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "run operator selection" })
    vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>",
        { silent = true, desc = "evaluate line" })
    vim.keymap.set("n", "<leader>mrr", ":MoltenReevaluateCell<CR>",
        { silent = true, desc = "re-evaluate cell" })
    vim.keymap.set("v", "<leader>mr", ":<C-u>MoltenEvaluateVisual<CR>gv",
        { silent = true, desc = "evaluate visual selection" })
    vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>",
        { silent = true, desc = "molten delete cell" })
    vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>",
        { silent = true, desc = "hide output" })
    vim.keymap.set("n", "<leader>ms", ":noautocmd MoltenEnterOutput<CR>",
        { silent = true, desc = "show/enter output" })
  end,
}
