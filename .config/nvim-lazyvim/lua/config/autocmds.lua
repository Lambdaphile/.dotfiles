-- Autocmds are automatically loaded on the VeryLazy event.
-- Default autocmds that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here with `vim.api.nvim_create_autocmd`.
--
-- Or remove existing autocmds by their group name (which is prefixed with
-- `lazyvim_` for the defaults).
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionRequestFinished",
  callback = function()
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("i", true, false, true),
      "n",
      false
    )
  end,
})
