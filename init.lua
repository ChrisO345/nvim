-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Create the :rterm command
vim.api.nvim_create_user_command("Rterm", function(opts)
  -- Open a vertical split to the right
  vim.cmd("vsplit")
  -- Build the shell command and run it in the terminal
  local cmd = table.concat(opts.fargs, " ")
  vim.cmd("terminal " .. cmd)
end, {
  nargs = "+", -- Require one or more arguments
  complete = "shellcmd", -- Enable shell command completion
})
