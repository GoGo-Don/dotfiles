return {
    "neovim/nvim-lspconfig",

    event = {"BufReadPre", "BufNewFile"},
    config = function()
    -- Language server configuration blocks
    vim.lsp.config.pyright = { -- Python
      settings = {
        python = {
          analysis = { typeCheckingMode = "basic" }
        }
      }
    }

    vim.lsp.config.rust_analyzer = { -- Rust
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          procMacro = { enable = true }
        }
      }
    }

    vim.lsp.config.ts_ls = { -- TypeScript/JavaScript (use ts_ls for nvim-lspconfig 0.11+)
      settings = {
        typescript = {
          inlayHints = { parameterNames = { enabled = "all" } }
        }
      }
    }

    vim.lsp.config.html = { -- HTML
      settings = {}
    }

    vim.lsp.config.cssls = { -- CSS (use cssls for lspconfig)
      settings = {}
    }

    -- Enable all desired servers for autostart
    vim.lsp.enable({
      "pyright",
      "rust_analyzer",
      "ts_ls",
      "html",
      "cssls"
    })

    -- Recommended keymaps for LSP in Neovim >=0.11
    local opts = { noremap = true, silent = true }
    local map = vim.keymap.set

    -- Normal mode LSP keymaps
    map("n", "gd", vim.lsp.buf.definition, opts)         -- Go to definition
    map("n", "K", vim.lsp.buf.hover, opts)               -- Hover docs
    map("n", "gr", vim.lsp.buf.references, opts)         -- Show references
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- Rename symbol
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code action
    map("n", "[d", vim.diagnostic.goto_prev, opts)       -- Prev diagnostic
    map("n", "]d", vim.diagnostic.goto_next, opts)       -- Next diagnostic
    map("n", "<leader>e", vim.diagnostic.open_float, opts) -- Show diagnostic message
    map("n", "<leader>q", vim.diagnostic.setloclist, opts) -- Diagnostic quickfix

    -- Mini reference for keymaps
    -- gd: go to definition
    -- K: show hover documentation
    -- gr: show references
    -- <space>rn: rename symbol
    -- <space>ca: code action
    -- [d / ]d: previous/next diagnostic
    -- <space>e: open diagnostic
    -- <space>q: add diagnostic to quickfix list
  end
}

