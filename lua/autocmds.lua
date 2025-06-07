-- Filetype detection, file-specific behavior, actions on events

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yankgroup = augroup("YankHighlight", {})
autocmd("TextYankPost", {
  group = yankgroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- Custom Filetypes
vim.filetype.add({
  pattern = {
  },
})
