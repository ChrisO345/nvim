return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
      vim.keymap.set("i", "<C-y>", "copilot#Accept()", {
        expr = true,
        silent = true,
        noremap = true,
        replace_keycodes = false,
        desc = "Accept Copilot suggestion",
      })
      vim.keymap.set(
        "i",
        "<C-K>",
        "copilot#Dismiss()",
        { expr = true, silent = true, desc = "Dismiss Copilot suggestion" }
      )

      -- Disable Copilot in .env files
      vim.api.nvim_create_autocmd("BufReadPre", {
        pattern = ".env*",
        callback = function() vim.b.copilot_enabled = false end,
      })
    end,
  },
  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        clear = {
          esc = true,
        },
      },
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
          create = "window",
        },
        tools = {
          copilot = {
            cmd = {
              "sh",
              "-c",
              [[
                wid=$(tmux display-message -p -t "$TMUX_PANE" "#{window_id}") &&
                tmux rename-window -t "$wid" copilot &&
                copilot --banner
              ]],
            },
          },
        },
      },
    },
  },
}
