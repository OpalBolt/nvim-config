-- Seamless <C-hjkl> movement and <C-A-hjkl> resize between nvim splits and
-- zellij panes. Companion to the zellij side of hiasr/vim-zellij-navigator:
-- since v0.2.0 that plugin is pure zellij (wasm keybinds in
-- ~/.config/zellij/config.kdl), nvim only needs these keymaps.
return {
  "mrjones2014/smart-splits.nvim",
  opts = {},
  -- stylua: ignore
  keys = {
    { "<C-h>",   function() require("smart-splits").move_cursor_left() end,  desc = "Window left" },
    { "<C-j>",   function() require("smart-splits").move_cursor_down() end,  desc = "Window down" },
    { "<C-k>",   function() require("smart-splits").move_cursor_up() end,    desc = "Window up" },
    { "<C-l>",   function() require("smart-splits").move_cursor_right() end, desc = "Window right" },
    { "<C-A-h>", function() require("smart-splits").resize_left(5) end,      desc = "Resize - vertical" },
    { "<C-A-j>", function() require("smart-splits").resize_down(5) end,      desc = "Resize + horizontal" },
    { "<C-A-k>", function() require("smart-splits").resize_up(5) end,        desc = "Resize - horizontal" },
    { "<C-A-l>", function() require("smart-splits").resize_right(5) end,     desc = "Resize + vertical" },
  },
}
