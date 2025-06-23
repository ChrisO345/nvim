-- Custom plugins are loaded in a per-os basis due to differing paths and availability
local plugins = {
  {
    dir = {
      linux = "~/personal/plugins/shroud.nvim",
      wsl = "/mnt/d/Plugins/shroud.nvim"
    },
    opts = {
      enabled = true,
    }
  },
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
