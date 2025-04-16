-- Settings for the mason.nvim plugin

return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "mypy",
      "ruff",
      "pyright",
      "flake8",
    },
  },
}
