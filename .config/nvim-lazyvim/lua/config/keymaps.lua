-- Keymaps are automatically loaded on the VeryLazy event.
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here.
local wk = require("which-key")
local map = LazyVim.safe_keymap_set

map(
  { "i", "x", "n", "s" },
  "<C-s>",
  "<cmd>wa<cr><esc>",
  { desc = "Save All Files" }
)

map("n", "<leader>uH", function()
  local gs = require("gitsigns")
  gs.toggle_linehl()
  gs.toggle_deleted()
  gs.toggle_word_diff()
end, { desc = "Highlight Hunks" })

Snacks.toggle
  .option("showtabline", { off = 0, on = 2, name = "Tabline" })
  :map("<leader>uA")

wk.add({
  { "<leader>a", group = "ai" },
  {
    "<leader>aa",
    "<cmd>CodeCompanionChat Toggle<cr>",
    desc = "Toggle Chat",
    mode = "n",
  },
  {
    "<leader>ad",
    group = "Diff Actions",
  },
})
