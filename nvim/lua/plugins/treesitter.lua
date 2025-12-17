return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	opts = function(_, opts)
		opts.ensure_installed = opts.ensure_installed or {}
		vim.list_extend(opts.ensure_installed, { "lua", "rust", "python", "typescript", "javascript" })
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			incremental_selection = { enable = true },
			indent = { enable = true },
		})

		-- Create autocmd inside config
		vim.api.nvim_create_autocmd({"BufReadPost", "BufWinEnter"}, {
			pattern = "*",
			callback = function()
				vim.cmd("normal! zx")
			end,
		})
	end,
}
