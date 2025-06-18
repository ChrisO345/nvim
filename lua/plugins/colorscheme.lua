return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
    priority = 10000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    name = "nord",
    priority = 10000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = "kanagawa",
    priority = 10000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
      })
    end
  },
}
