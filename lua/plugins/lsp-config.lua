return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")

      -- TODO: Require from a custom lang folder all different language servers:
      --  structure of folder would be langs/init.lua <- this gets required, and loads all available
      --   language servers, and then langs/python.lua <- this is the configuration for the python language server

      lspconfig.lua_ls.setup({
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim
              .lsp
              .get_client_by_id(
                args.data
                .client_id)
          if not client then return end

          ---@diagnostic disable-next-line: missing-parameter
          if client.supports_method("textDocument/formatting") then
            vim.api
                .nvim_create_autocmd(
                  "BufWritePre",
                  {
                    buffer =
                        args.buf,
                    callback = function()
                      vim.lsp
                          .buf
                          .format({
                            bufnr =
                                args.buf,
                            id =
                                client.id
                          })
                    end,
                  })
          end
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
    end,
  },
}
