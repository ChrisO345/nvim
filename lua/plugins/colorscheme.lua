return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
    priority = 10000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end
  }
}
