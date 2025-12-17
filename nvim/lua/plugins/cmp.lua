return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
	},
	event = { "InsertEnter" },
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
			formatting = {
				format = require("lspkind").cmp_format({ with_text = false, maxwidth = 50 }),
			},
		})
		-- Set completion options globally (move to init.lua ideally)
		vim.opt.completeopt = "menuone,noinsert,noselect"
	end,
}
