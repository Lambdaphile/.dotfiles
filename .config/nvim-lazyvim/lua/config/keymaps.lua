-- Keymaps are automatically loaded on the VeryLazy event.
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here.
local map = LazyVim.safe_keymap_set

map(
  { "i", "x", "n", "s" },
  "<leader>fs",
  "<cmd>wa<cr><esc>",
  { desc = "Save All Files" }
)
map(
  { "i", "x", "n", "s" },
  "<C-s>",
  "<cmd>wa<cr><esc>",
  { desc = "Save All Files" }
)
