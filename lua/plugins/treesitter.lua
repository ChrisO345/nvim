local is_wsl = vim.fn.has("wsl") == 1

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    -- ensure_installed = {},
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    if not is_wsl then
      require("nvim-treesitter.install").compilers = { "zig" }
    end
  end,
}
