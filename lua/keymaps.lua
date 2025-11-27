local keymaps_path = vim.fn.stdpath("config") .. "/lua/keymaps/"

for _, file in ipairs(vim.fn.glob(keymaps_path .. "*.lua", true, true)) do
  local module = "keymaps." .. vim.fn.fnamemodify(file, ":t:r") -- remove path & .lua
  require(module)
end
