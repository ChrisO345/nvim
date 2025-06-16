-- Windows-specific LSP configuration
-- Note: For unknown reasons, language servers do not auto-start on Windows.
-- This file serves as a template only. Future changes made here are git-ignored.

local lspconfig = require("lspconfig")

-- Lua
lspconfig.lua_ls.setup({})
lspconfig.stylua.setup({})

-- Python
lspconfig.pyright.setup({})
lspconfig.ruff.setup({})

-- Go
lspconfig.gofumpt.setup({})
lspconfig.gopls.setup({})
