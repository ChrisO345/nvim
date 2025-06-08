local arch = {}

local win = {}

local wsl = {
  {
    {
      dir = "/mnt/d/Plugins/shroud.nvim",
      opts = {
        enabled = true,
      }
    }
  },
}

-- Configure based on which machine this is running on
local plugs = {}
if vim.fn.has("arch") == 1 then
  print("Loading Arch plugins")
  plugs = arch
elseif vim.fn.has("wsl") == 1 then -- WSL has to be checked before Windows
  plugs = wsl
elseif vim.fn.has("windows") == 1 then
  plugs = win
else
  print("Unknown OS, no plugins loaded")
end

return plugs
