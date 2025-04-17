return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function()
      local null_ls = require("null-ls")
      local sources = {
        require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
        require("none-ls.formatting.ruff_format"),
      }

      null_ls.setup({
        sources = sources,
      })
    end,
  },
}
