--- Opens a terminal in a vertical split on the right.
-- Usage: :Rterm [any shell command]?
-- Example: :Rterm python or :Rterm top
vim.api.nvim_create_user_command("Rterm", function(opts)
  vim.cmd("vsplit") -- Open a vertical split to the right

  local cmd = table.concat(opts.fargs, " ") -- Join all args into a single shell command
  vim.cmd("terminal " .. cmd) -- Open terminal with the command
end, {
  nargs = "*", -- Accept any number of arguments
  complete = "shellcmd", -- Enable shell command autocompletion
})

--- Opens the LazyVim dashboard.
-- Usage: :Dashboard
vim.api.nvim_create_user_command("Dashboard", function()
  vim.cmd("lua Snacks.dashboard()")
end, {})

--- Opens a powershell terminal in horizontal split on the bottom. Resizes to 8 lines.
-- Usage: :Pwsh [any shell command]?
-- Example: :Pwsh or :Pwsh python
vim.api.nvim_create_user_command("Shell", function(opts)
  -- Create a horizontal split at the bottom with height 8 lines
  vim.cmd("split")
  vim.cmd("resize 8")

  -- Open PowerShell terminal (pwsh), with optional command passed by user
  local cmd = table.concat(opts.fargs, " ") -- Join all args into a single shell command
  vim.cmd("terminal " .. cmd) -- Open the terminal with the specified command

  -- Automatically enter insert mode after opening the terminal
  vim.cmd("startinsert")
end, {
  nargs = "*", -- Allow optional arguments (e.g., a shell command like python)
  complete = "shellcmd", -- Shell command autocompletion
})
vim.cmd("abbrev shell Shell")
