-- Used to ensure the local LSPs are loaded on a per-machine basis
local function get_os()
  if vim.fn.has("wsl") == 1 then
    return "wsl"
  elseif vim.fn.has("linux") == 1 then
    return "linux"
  elseif vim.fn.has("windows") == 1 then
    return "windows"
  else
    return "unknown"
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim",           opts = {} },
      { "mason-org/mason-lspconfig.nvim", opts = {} },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      }
    },
    custom = {
      {
        name = "lapdog",
        cmd = { "/home/chris/personal/lapdog/lapdog" },
        file_type = { "matlab" }, -- Octave/Matlab
        os = { "linux" }
      },
    },
    config = function(plugin)
      vim.diagnostic.config({ virtual_text = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          print("LSP Client attached: " .. client.name)

          -- Enable Formatting
          if vim.lsp.client.supports_method(client, "textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end

          -- Enable Inlay Hints
          if vim.lsp.client.supports_method(client, "textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
          end
        end,
      })


      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})

      -- Custom Defined LSPs not in mason or lspconfig
      local os = get_os()
      for _, server in ipairs(plugin.custom or {}) do
        if server.os and vim.tbl_contains(server.os, os) then
          for _, ft in ipairs(server.file_type or {}) do
            vim.api.nvim_create_autocmd("FileType", {
              pattern = ft,
              callback = function()
                vim.lsp.start({
                  name = server.name,
                  cmd = server.cmd,
                  root_dir = vim.fn.getcwd(),
                })
              end,
            })
          end
        end
      end
    end,
  },
}
