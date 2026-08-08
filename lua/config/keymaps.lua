-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local wk = require("which-key")

-- General No leader keybinds
-- (left as vim.keymap.set — these aren't <leader> mappings, so which-key
-- has no popup/group to show for them; wk.add() would work but adds nothing here)
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit out of insert mode" })
vim.keymap.set("n", "n", "nzz", { desc = "Center search results" })
vim.keymap.set("n", "N", "Nzz", { desc = "Center search results" })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Visual line wraps up", expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Visual line wraps down", expr = true })
vim.keymap.set("v", "<", "<gv", { desc = "Better indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Better indent" })
vim.keymap.set("v", "p", "_dp", { desc = "Paste over selected text" })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "better indent" })
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "better indent" })
vim.keymap.set("i", "<C-BS>", "<C-o>diw", { desc = "Delete word at a time insert" })
vim.keymap.set("n", "W", "b", { desc = "Jump back a word" })

-- Window management
wk.add({
  { "<leader>w", group = "Window" },
  { "<C-A-h>",   ":vertical resize -5<CR>", desc = "- Vertical size" },
  { "<C-A-j>",   ":resize +5<CR>",          desc = "+Horizontal size" },
  { "<C-A-k>",   ":resize -5<CR>",          desc = "-Horizontal size" },
  { "<C-A-l>",   ":vertical resize +5<CR>", desc = "+Vertical size" },
  { "<C-h>",     "<C-W><C-H>",              desc = "Move to right window" },
  { "<C-j>",     "<C-W><C-J>",              desc = "Move to down window" },
  { "<C-k>",     "<C-W><C-K>",              desc = "Move to up window" },
  { "<C-l>",     "<C-W><C-L>",              desc = "Move to left window" },
})

-- Keybinds for debugging
wk.add({
  { "<leader>d",   group = "Debug" },
  { "<leader>db",  function() require("dap").toggle_breakpoint() end,  desc = "Toggle breakpoint" },

  { "<leader>dp",  group = "PythonDebug" },
  { "<leader>dpr", function() require("dap-python").test_method() end, desc = "Start Python debugger" },
})

-- Telescope edits
wk.add({
  { "<leader>f",  group = "File" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Fuzzy find File" },
  { "<leader>fl", "<cmd>Telescope live_grep<CR>",  desc = "Fuzzy find with grep" },
})
