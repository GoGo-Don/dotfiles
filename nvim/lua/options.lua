 -- Option to get folding using treesitter
 vim.api.nvim_create_autocmd({ "BufEnter" }, {
     pattern = {"*"},
     command = "normal zx",
 })

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "NONE" })
-- Hint use ':h <option>' to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'	-- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a' 			-- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4			-- number of visual spaces per TAB
vim.opt.softtabstop = 4			-- number of spaces in tab when editing
vim.opt.shiftwidth = 4			-- insert 4 spaces on a TAB
vim.opt.expandtab = true		-- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true			-- show absolute number
vim.opt.relativenumber = true		-- add numbers to each line
vim.opt.cursorline = true		-- highlight cursor line underneath the cursor horizontally
vim.opt.cursorcolumn = true		-- highliht cursor column
vim.opt.splitbelow = true		-- open new vertical split bottom
vim.opt.splitright = true		-- open new horizontal splits right
vim.opt.termguicolors = true	-- enable 24-bit RGB colour in the TUI
vim.o.completeopt = "menu,menuone,noselect"
-- vim.opt.showmode = false		-- we are experienced, we do not need the '--INSERT--' mode hint

-- Searching
vim.opt.incsearch = true		-- search as characters are typed
vim.opt.hlsearch = false		-- do not highlight searches
vim.opt.ignorecase = true		-- ignore case in searches by default
vim.opt.smartcase = true		-- but make it case sensitive if an uppercase letter is typed

-- Folding
vim.api.nvim_create_autocmd({"FileType"}, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "indent"
    end
  end
})
vim.opt.foldenable = true    -- change to true if you want folds closed on open
vim.opt.foldlevel = 0        -- avoid closed folds by default
-- Line wrapping
vim.opt.wrap = false

-- Swap and undo files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. "/.config/nvim/undodir/"
vim.opt.undofile = true

-- Misc
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.g.python3_host_prog = "/usr/bin/python3"
