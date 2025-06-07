return {
  "mbbill/undotree",
  config = function()
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SplitWidth = 30
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_DiffAutoOpen = 0
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_HelpLine = 0
    vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
  end,
}
