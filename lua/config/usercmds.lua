--- Opens a terminal in a vertical split on the right.
-- Usage: :Rterm [any shell command]?
-- Example: :Rterm python or :Rterm top
vim.api.nvim_create_user_command("Rterm", function(opts)
  vim.cmd("vsplit")

  local cmd = table.concat(opts.fargs, " ")
  vim.cmd("terminal " .. cmd)
end, {
  nargs = "*",
  complete = "shellcmd",
})

--- Opens the LazyVim dashboard.
-- Usage: :Dashboard
vim.api.nvim_create_user_command("Dashboard", function()
  vim.cmd("lua Snacks.dashboard()")
end, {})

--- Opens a terminal in horizontal split on the bottom. Resizes to 8 lines.
-- Usage: :Pwsh [any shell command]?
-- Example: :Pwsh or :Pwsh python
vim.api.nvim_create_user_command("Shell", function(opts)
  vim.cmd("split")
  vim.cmd("resize 8")

  local cmd = table.concat(opts.fargs, " ")
  vim.cmd("terminal " .. cmd)

  vim.cmd("startinsert")
end, {
  nargs = "*",
  complete = "shellcmd",
})
