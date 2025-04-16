return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    opts = function()
      return require("plugins.config.null-ls")
    end,
  },
}
