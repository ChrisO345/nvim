local uname = vim.loop.os_uname()

local M = {}

-- Detect operating system
M.SYSTEM = (function()
  local sysname = uname.sysname
  local release = uname.release:lower()
  local version = uname.version:lower()

  -- Check for Windows
  if sysname == "Windows_NT" then
    return "windows"
  -- Check for macOS
  elseif sysname == "Darwin" then
    return "mac"
  -- Check for Linux
  elseif sysname == "Linux" then
    if version:find("ubuntu") then
      return "ubuntu"
    elseif version:find("debian") then
      return "debian"
    elseif release:find("wsl") then
      return "wsl"
    else
      return "linux"
    end
  else
    return "unknown"
  end
end)()

-- Define constants for different systems
M.WINDOWS = M.SYSTEM == "windows"
M.WSL = M.SYSTEM == "wsl"
M.MAC = M.SYSTEM == "mac"
M.LINUX = M.SYSTEM == "linux"
M.UBUNTU = M.SYSTEM == "ubuntu"
M.DEBIAN = M.SYSTEM == "debian"

return M
