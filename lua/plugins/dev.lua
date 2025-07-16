-- Custom plugins are loaded in a per-os basis due to differing paths and availability
-- This file serves as a template only. Future changes made here are git-ignored.
local plugins = {
  {
    dir = {
      linux = "~/personal/plugins/schnapper.nvim",
      wsl = "/mnt/d/Plugins/schnapper.nvim",
      windows = "D:/Plugins/schnapper.nvim"
    },
    opts = {
      enabled = true,
    }
  },
}

local ret = {}
for _, plugin in ipairs(plugins) do
  local dir = plugin.dir[vim.g.os]
  if dir then
    table.insert(ret, {
      dir = dir,
      opts = plugin.opts
    })
  end
end

return ret
