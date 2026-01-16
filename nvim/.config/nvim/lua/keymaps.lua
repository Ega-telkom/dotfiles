-- lua/keymaps.lua

vim.g.mapleader = ' '

-- Move line(s) Visually up or down
vim.keymap.set("x", "K", ":m-2<CR>gv=gv", { silent = true })
vim.keymap.set("x", "J", ":m'>+1<CR>gv=gv", { silent = true })

-- Move line(s) indentation Visually left or right
vim.keymap.set("x", "<Tab>", ">gv", { silent = true })
vim.keymap.set("x", "<S-Tab>", "<gv", { silent = true })

-- Open File Explorer
vim.keymap.set("n", "<leader>e", function()
  require("mini.files").open()
end, { desc = "Open file explorer" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { silent = true })
vim.keymap.set("n", "<leader>Y", '"+Y', { silent = true })

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { silent = true })

-- Cut (delete) to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', { silent = true })
vim.keymap.set("n", "<leader>D", '"+D', { silent = true })

-- Toggle terminal
vim.keymap.set('n', '<leader>tt', function()
  require('terminal').toggle()
end, { desc = 'Toggle terminal' })

-- Run command in terminal
vim.keymap.set('n', '<leader>tr', function()
  require('terminal').run()
end, { desc = 'Run terminal command' })

-- Send text ke terminal
vim.keymap.set({ 'n', 't' }, '<C-t>', function()
  return require('terminal.mappings').operator_send()
end, { expr = true, desc = 'Send to terminal' })

-- Escape terminal insert mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
