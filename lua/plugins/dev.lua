-- Custom plugins are loaded in a per-os basis due to differing paths and availability
local arch = {
  {
    dir = "~/personal/plugins/shroud.nvim/",
    opts = {
      enabled = true,
    }
  }
}

local win = {
  {
    dir = "D:/Plugins/schnapper.nvim",
    opts = {
      enabled = true
    }
  }
}

local wsl = {
  {
    dir = "/mnt/d/Plugins/shroud.nvim",
    opts = {
      enabled = true,
    }
  },
  {
    dir = "/mnt/d/Plugins/schnapper.nvim",
    opts = {
      enabled = true,
    }
  }
}

-- Configure based on which machine this is running on
local plugs = {}
if vim.g.os == "wsl" then
  plugs = wsl
elseif vim.g.os == "linux" then
  plugs = arch
elseif vim.g.os == "windows" then
  plugs = win
end

return plugs
