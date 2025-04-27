-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")
require("config.usercmds")

local os = require("utils.os_utils")

if os.WINDOWS then
  require("mason").setup({
    install_root_dir = "D:/Neovim-Plugins/Mason",
  })
end

print("Loaded NVIM settings")
