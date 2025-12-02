return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      animate = { enabled = false },
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      image = { enabled = true },
      picker = {
        enabled = true,
        layout = {
          cycle = true,
          preset = "default",
        },
        win = {
          input = { keys = { ["<ESC>"] = { "focus_preview", mode = { "i", "n" } } } },
          preview = { keys = { ["<ESC>"] = { "close", mode = { "i", "n", "v" } } } },
        },
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scratch = {
        enabled = true,
        name = "Scratch Buffer",
        ft = "markdown",
        icon = { "󱕆", "keyword" },
        -- Per Project Scratch Files
        file = vim.fn.stdpath("data") .. "/scratch/" .. vim.fn.fnamemodify(
          (function()
            local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
            if git_root == "" then return vim.fn.getcwd() end
            return vim.fn.fnamemodify(git_root, ":t")
          end)(),
          ":t"
        ) .. ".md",
      },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {},
  },
}
