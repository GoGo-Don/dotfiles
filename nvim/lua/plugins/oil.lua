return {
		"stevearc/oil.nvim",

		config = function()
			require("oil").setup({
				-- Optional configuration
				columns = {"icon", "permissions", "size", "mtime"},
				show_hidden = true,
				keymaps = {
					["<CR>"] = "actions.select",			-- Enter to open file/folder
					["<C-p>"] = "actions.preview",		-- Ctrl+p to preview file
					["-"] = "actions.parent",					-- Minus to go up directory
				},
			})
        vim.keymap.set("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
 }
