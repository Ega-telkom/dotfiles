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

-- Pick everything
vim.keymap.set("n", "<leader>/", function()
  require("mini.pick").builtin.grep_live()
end, { desc = "Pick buffers" })

-- Buffer Management
--
vim.keymap.set('n', '<leader>db', function()
  require('mini.bufremove').delete()
end, { desc = 'Delete buffer' })

-- Force delete
vim.keymap.set('n', '<leader>dB', function()
  require('mini.bufremove').delete(0, true)
end, { desc = 'Force delete buffer' })

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

-- Treesitter text objects
local ts = function(obj, query)
  return function()
    require("nvim-treesitter-textobjects.select").select_textobject(obj, query or "textobjects")
  end
end

-- Functions
vim.keymap.set({ "x", "o" }, "af", ts("@function.outer"))
vim.keymap.set({ "x", "o" }, "if", ts("@function.inner"))

-- Classes
vim.keymap.set({ "x", "o" }, "ac", ts("@class.outer"))
vim.keymap.set({ "x", "o" }, "ic", ts("@class.inner"))

-- Conditionals (if/else)
vim.keymap.set({ "x", "o" }, "ai", ts("@conditional.outer"))
vim.keymap.set({ "x", "o" }, "ii", ts("@conditional.inner"))
--
-- Loops
vim.keymap.set({ "x", "o" }, "al", ts("@loop.outer"))
vim.keymap.set({ "x", "o" }, "il", ts("@loop.inner"))

-- Parameters/arguments
vim.keymap.set({ "x", "o" }, "aa", ts("@parameter.outer"))
vim.keymap.set({ "x", "o" }, "ia", ts("@parameter.inner"))

-- Comments
vim.keymap.set({ "x", "o" }, "a/", ts("@comment.outer"))

-- Blocks
vim.keymap.set({ "x", "o" }, "ab", ts("@block.outer"))
vim.keymap.set({ "x", "o" }, "ib", ts("@block.inner"))

-- Scope
vim.keymap.set({ "x", "o" }, "as", ts("@local.scope", "locals"))

-- Split windows
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontal' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close split' })

-- Resize
vim.keymap.set('n', '<S-k>', '<cmd>resize +2<CR>')
vim.keymap.set('n', '<S-j>', '<cmd>resize -2<CR>')
vim.keymap.set('n', '<S-l>', '<cmd>vertical resize -2<CR>')
vim.keymap.set('n', '<S-h>', '<cmd>vertical resize +2<CR>')

-- Navigate splits
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Clipboard
--
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>d', '"+d', { desc = 'Cut to clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P', { desc = 'Paste before from clipboard' })
