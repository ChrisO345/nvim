local map = vim.keymap.set

-- LSP Hover
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- LSP Functions
map("n", "<leader>ca", vim.lsp.buf.code_action, {})
map("n", "<leader>cr", vim.lsp.buf.rename, {})

-- Diagnostics
local diagnostic_goto = function(next, severity)
  ---@diagnostic disable-next-line: deprecated
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function() go({ severity = severity }) end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Snacks LSP Pickers
map("n", "<leader>sd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
map("n", "<leader>sD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
map("n", "<leader>sr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
map("n", "<leader>sI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
map("n", "<leader>sy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
