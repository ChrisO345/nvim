-- Settings for the mason.nvim plugin

return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "ruff",
      "flake8",
    },
  },
}
