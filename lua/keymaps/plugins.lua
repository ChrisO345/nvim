local map = vim.keymap.set

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Snacks - Pickers
map({ "n", "v" }, "<leader><space>", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>?", function() Snacks.picker.keymaps() end, { desc = "Keymaps Picker" })
map("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers Picker" })
map("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History Picker" })
map("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History Picker" })
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })
map("n", "<leader>ff", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
map("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
map("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects Picker" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent Picker" })
map(
  "n",
  "<leader>fc",
  function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
  { desc = "Find Config File" }
)

-- Snacks - Grep
map("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })

-- Flash
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "o", "x" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })

-- Snacks - Git
map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
map("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff" })
map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
map("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })

-- Snacks - Search
map("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
map("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
map("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
map("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
map("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
map("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
map("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
map("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
map("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
map("n", "<leader>sr", function() Snacks.picker.resume() end, { desc = "Resume" })
map("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

-- Snacks - Toggle
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
Snacks.toggle.zen():map("<leader>uz")

-- Snacks - Other
map("n", "<leader>.", function() Snacks.scratch() end, { desc = "Open Scratch Buffer" })
map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })

-- TreeSitter
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input("I")
end, { desc = "Inspect Tree" })

-- Undotree
map("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- Sidekick
map("n", "<tab>", function()
  if not require("sidekick").nes_jump_or_apply() then return "<Tab>" end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })
map(
  "n",
  "<leader>aa",
  function() require("sidekick.cli").toggle({ name = "copilot", focus = true }) end,
  { desc = "Sidekick Toggle Copilot CLI" }
)
map("n", "<leader>ad", function() require("sidekick.cli").close() end, { desc = "Detach a CLI Session" })
map({ "n", "x" }, "<leader>ap", function() require("sidekick.cli").prompt() end, { desc = "Sidekick Select Prompt" })
