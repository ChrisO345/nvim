local is_wsl = vim.fn.has("wsl") == 1

-- Disable animations
vim.g.snacks_animate = false

-- Set default shell to PowerShell
-- if is_wsl then
--   vim.opt.shell = "/bin/bash" -- or whatever shell you use in WSL
-- else
--   vim.opt.shell = "powershell -NoLogo" -- use PowerShell for native Windows
-- end
