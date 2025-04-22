-- ~/.config/nvim/lua/plugins/snacks.lua
local os = require("utils.os_utils")
local header = require("utils.header_utils")

vim.api.nvim_set_hl(0, "SnacksHeaderWSL", { fg = "#00ff00" })

local header_display = header.NVIM
local header_indent = header.NVIM_OFFSET
if os.WSL then
  header_display = header.WSL
  header_indent = header.WSL_OFFSET
elseif os.WINDOWS then
  header_display = header.WINDOWS
  header_indent = header.WINDOWS_OFFSET
end

local split_pane = {
  {
    "folke/tokyonight.nvim",
    opts = function(_, opts)
      opts.lualine_bold = true
      opts.on_highlights = function(hl, c)
        local color = c.green
        if os.WSL then
          color = c.green
        elseif os.WINDOWS then
          color = c.blue2
        end
        hl["SnacksDashboardHeader"] = {
          fg = color,
        }
      end
      return opts
    end,
  },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = {
        sections = {
          { section = "header", padding = 5, indent = header_indent },
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
            title = "Recent Projects",
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
        command = os.WSL and "fdfind" or "fd",
      }
      opts.explorer = {
        show_hidden = true,
      }
    end,
  },
}

return split_pane
