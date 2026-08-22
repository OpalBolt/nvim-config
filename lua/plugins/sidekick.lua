-- sidekick.nvim: AI CLI integration (default: pi, opencode available via <leader>as)
-- Highlight code, hit <leader>ae, ask "What does this do"
return {
  {
    "folke/sidekick.nvim",
    opts = {
      -- CLI-only setup. NES (Next Edit Suggestions) needs a Copilot
      -- subscription + copilot-language-server; flip this to true to enable.
      nes = { enabled = false },
      cli = {
        mux = {
          -- persist CLI sessions in zellij, never tmux
          backend = "zellij",
          enabled = true,
        },
        -- run AI tools inside nono sandboxes. Built-in tool configs
        -- (sk/cli/{tool}.lua) are merged with these, so resume/continue
        -- args are appended after `--` and still work.
        tools = {
          pi = { cmd = { "nono", "run", "-p", "pi", "--allow-cwd", "--", "pi" } },
          opencode = { cmd = { "nono", "run", "-p", "opencode", "--allow-cwd", "--", "opencode" } },
        },
      },
    },
    -- stylua: ignore
    keys = {
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle({ name = "pi", focus = true }) end,
        desc = "PI toggle",
      },
      {
        "<leader>ae",
        function() require("sidekick.cli").send({ msg = "What does this code do?\n{selection}" }) end,
        mode = "x",
        desc = "Explain selection",
      },
      {
        "<leader>ap",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Select AI prompt",
      },
      {
        "<leader>as",
        function() require("sidekick.cli").select() end,
        desc = "Select AI CLI",
      },
      {
        "<leader>at",
        function() require("sidekick.cli").send({ msg = "{this}" }) end,
        mode = { "x", "n" },
        desc = "Send this",
      },
      {
        "<leader>af",
        function() require("sidekick.cli").send({ msg = "{file}" }) end,
        desc = "Send file",
      },
      {
        "<c-.>",
        function() require("sidekick.cli").focus() end,
        mode = { "n", "t", "i", "x" },
        desc = "Focus AI CLI",
      },
    },
  },
}
