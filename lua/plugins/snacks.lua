-- ~/.config/nvim/lua/plugins/snacks.lua

local split_pane = {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.dashboard = {
      sections = {
        { section = "header", indent = 60, padding = 5 },
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
          section = "recent_files",
          action = ":lua Snacks.dashboard.pick('oldfiles')",
          indent = 2,
          padding = 1,
        },
        {
          pane = 2,
          icon = " ",
          key = "p",
          title = "Recent Projects",
          section = "projects",
          action = ":lua Snacks.dashboard.pick('projects')",
          indent = 2,
          padding = 5,
        },
        { section = "startup", indent = 60 },
      },
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
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
  end,
}

return split_pane
