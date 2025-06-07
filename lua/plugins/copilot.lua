return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
    -- vim.g.copilot_assume_mapped = true
    vim.g.copilot_filetypes = {
      ["*"] = true, -- Enable by default
      -- ["env"] = false, -- Disable for .env files
    }
    vim.keymap.set("i", "<C-y>", 'copilot#Accept()',
      { expr = true, silent = true, noremap = true, replace_keycodes = false, desc = "Accept Copilot suggestion" })
    vim.keymap.set("i", "<C-K>", 'copilot#Dismiss()', { expr = true, silent = true, desc = "Dismiss Copilot suggestion" })

    vim.api.nvim_create_autocmd("BufReadPre", {
      pattern = ".env*",
      callback = function()
        vim.b.copilot_enabled = false
      end,
    })
  end,
}
