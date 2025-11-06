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
  {
    "/sainnhe/sonokai",
    lazy = false,
    name = "sonokai",
    priority = 10000,
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_transparent_background = true
      vim.g.sonokai_style = "default"

      -- vim.cmd.colorscheme("sonokai")
    end
  },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup({})
      -- require('bamboo').load()
    end,
  },
}
