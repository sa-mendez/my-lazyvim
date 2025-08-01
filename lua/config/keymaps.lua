-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove these LazyVim bindings that I want to delete or have replaced
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>l")

-- ⏩ Next buffer
vim.keymap.set("n", "<leader><Right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- ⏪ Previous buffer
vim.keymap.set("n", "<leader><Left>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
