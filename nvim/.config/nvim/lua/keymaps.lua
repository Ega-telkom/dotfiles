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

-- Toggle Wrap
vim.keymap.set("n", "<leader>w", function()
  vim.wo.wrap = not vim.wo.wrap
end)

-- Open mini.pick
--

-- Pick files
vim.keymap.set("n", "<leader>f", function()
  require("mini.pick").builtin.files()
end, { desc = "Pick files" })

-- Pick buffer
vim.keymap.set("n", "<leader>b", function()
		require("mini.pick").builtin.buffers()
end, { desc = "Pick buffers" })

-- LSP dialog
--

-- LSP Info
vim.keymap.set('n', 'K', vim.lsp.buf.hover)

-- Diagnostic
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

-- Terminal
--

-- Open Terminal
vim.keymap.set("n", "<leader>t", "<cmd>term<CR>")

-- Open Terminal in Vertical Split
vim.keymap.set("n", "<leader>vt", "<cmd>vsplit | term<CR>")

-- Open Terminal in Horizontal Split
vim.keymap.set("n", "<leader>st", "<cmd>split | term<CR>")

-- Go to Normal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
