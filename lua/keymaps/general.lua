-- Keyboard shortcuts and command bindings
local map = vim.keymap.set

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Open Messages
map({ "n", "v" }, "<leader>m", "<cmd>messages<cr>", { desc = "Show Messages" })

-- Run Lua Code
map("n", "<leader>X", "<cmd>source %<cr>", { desc = "Source Current File" })
map("n", "<leader>x", ":.lua<CR>", { desc = "Lua Run File" })
map("v", "<leader>x", ":lua<CR>", { desc = "Lua Run Selected Lines" })

-- Define a custom text object "g" for entire buffer
map("x", "ag", ":<C-u>normal! ggVG<CR>", {})
map("o", "ag", ":normal! ggVG<CR>", {})

-- Update Rendering
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- OS Based Terminal Fixes
if vim.g.os == "linux" then
  map("n", "<C-/>", function() Snacks.terminal() end, { desc = "Terminal" })
  map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
else
  map("t", "<C-_>", "<cmd>close<cr>", { desc = "Hide Terminal" })
end
