-- ~/.config/nvim/lua/plugins/snacks.lua
vim.api.nvim_set_hl(0, "SnacksHeaderWSL", { fg = "#00ff00" })
local is_wsl = vim.fn.has("wsl") == 1

local split_pane = {
  {
    "folke/tokyonight.nvim",
    opts = function(_, opts)
      opts.lualine_bold = true
      opts.on_highlights = function(hl, c)
        hl["SnacksDashboardHeader"] = {
          fg = is_wsl and c.green or c.blue2,
        }
      end
      return opts
    end,
  },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local header_indent = is_wsl and 60 or 50
      local header_display = is_wsl
          and [[
██╗    ██╗███████╗██╗     
██║    ██║██╔════╝██║     
██║ █╗ ██║███████╗██║     
██║███╗██║╚════██║██║     
╚███╔███╔╝███████║███████╗
 ╚══╝╚══╝ ╚══════╝╚══════╝]]
        or [[
██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗███████╗
██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔════╝
██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║███████╗
██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║╚════██║
╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║
 ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝]]
      opts.dashboard = {
        sections = {
          { section = "header", indent = header_indent, padding = 5 },
          { section = "keys", gap = 1, padding = 5 },
          {
            pane = 2,
            indent = 2,
            padding = 10,
            height = 10,
          },
          {
            pane = 2,
            icon = " ",
            key = "r",
            title = "Recent Files",
            action = ":lua Snacks.dashboard.pick('recent_files')",
            indent = 2,
            padding = 0,
          },
          {
            pane = 2,
            section = "recent_files",
            indent = 2,
            padding = 1,
          },
          {
            pane = 2,
            icon = " ",
            title = "Recent Projcets",
            key = "p",
            action = ":lua Snacks.dashboard.pick('projects')",
            indent = 2,
            padding = 0,
          },
          {
            pane = 2,
            section = "projects",
            indent = 2,
            padding = 5,
          },
          { section = "startup", indent = 60 },
        },
        preset = {
          header = { header_display, hl = "header" },
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      }
      opts.finder = {
        command = is_wsl and "fdfind" or "fd",
      }
    end,
  },
}

return split_pane
