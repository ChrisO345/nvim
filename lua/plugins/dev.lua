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
if vim.fn.has("wsl") == 1 then -- WSL has to be checked before others as it will match both
  plugs = wsl
elseif vim.fn.has("linux") == 1 then
  plugs = arch
elseif vim.fn.has("windows") == 1 then
  plugs = win
else
  print("Unknown OS, no plugins loaded")
end

return plugs
