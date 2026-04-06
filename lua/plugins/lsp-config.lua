return {
  -- Mason (instala servidores automáticamente)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  -- Conecta mason con lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "html",
          "emmet_ls",
          "intelephense",
          "clangd",
        },
      })
    end,
  },
  -- LSP principal
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LUA
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- TYPESCRIPT
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      -- HTML
      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      -- EMMET
      vim.lsp.config("emmet_ls", {
        capabilities = capabilities,
        filetypes = {
          "html",
          "css",
          "blade",
          "javascript",
          "javascriptreact",
          "typescriptreact",
        },
      })

      -- PHP
      vim.lsp.config("intelephense", {
        capabilities = capabilities,
        settings = {
          intelephense = {
            files = { maxsize = 5000000 },
          },
        },
      })

      -- C/C++
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })

      -- Enable all servers
      vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "html",
        "emmet_ls",
        "intelephense",
        "clangd",
      })

      -- KEYMAPS
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      -- AUTO FORMAT
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },
}
