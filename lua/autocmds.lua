-- Filetype detection, file-specific behavior, actions on events

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yankgroup = augroup("YankHighlight", {})
autocmd("TextYankPost", {
  group = yankgroup,
  pattern = "*",
  callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 }) end,
})

-- Store a global variable for the OS type
local os_types = {
  "wsl", -- WSL has to be checked before others as it will match both
  "linux",
  "windows",
}

vim.g.os = "unknown" -- Default value if no OS matches
for _, os in ipairs(os_types) do
  if vim.fn.has(os) == 1 then
    vim.g.os = os
    break
  end
end
