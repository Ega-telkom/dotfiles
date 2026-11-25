-- lua/keymaps.lua

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
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)

-- Diagnostic
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float)

-- Diagnostic Navigation
vim.keymap.set('n', ']l', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Next diagnostic' })

vim.keymap.set('n', '[l', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Previous diagnostic' })

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

-- Reset visual selection
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

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

-- Split
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split horizontal' })
vim.keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = 'Close split' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Equalize splits' })

-- Navigate
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Go left' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Go down' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Go up' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Go right' })

-- Resize (arah huruf = arah membesar)
vim.keymap.set('n', '<leader>wH', '<cmd>vertical resize -8<CR>', { desc = 'Narrower' })
vim.keymap.set('n', '<leader>wL', '<cmd>vertical resize +8<CR>', { desc = 'Wider' })
vim.keymap.set('n', '<leader>wJ', '<cmd>resize -8<CR>', { desc = 'Shorter' })
vim.keymap.set('n', '<leader>wK', '<cmd>resize +8<CR>', { desc = 'Taller' })

-- Clipboard
--
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d', { desc = 'Cut to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { desc = 'Paste before from clipboard' })

-- Formatting
vim.keymap.set({ "n", "v" }, "<leader>=", vim.lsp.buf.format, {
  desc = "Format",
})

-- mini.keymaps
--
local map_multistep = require('mini.keymap').map_multistep

map_multistep('i', '<Tab>', { 'pmenu_next' })
map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
map_multistep('i', '<BS>', { 'minipairs_bs' })

-- Make jump mappings or skip to use built-in <Tab>/<S-Tab> in Neovim>=0.11
local jump_next = function()
  if vim.snippet.active({ direction = 1 }) then return vim.snippet.jump(1) end
end
local jump_prev = function()
  if vim.snippet.active({ direction = -1 }) then vim.snippet.jump(-1) end
end
vim.keymap.set({ 'i', 's' }, '<C-l>', jump_next)
vim.keymap.set({ 'i', 's' }, '<C-h>', jump_prev)
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
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)

-- Diagnostic
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float)

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

-- Reset visual selection
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

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

-- Split
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split horizontal' })
vim.keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = 'Close split' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Equalize splits' })

-- Navigate
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Go left' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Go down' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Go up' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Go right' })

-- Resize (arah huruf = arah membesar)
vim.keymap.set('n', '<leader>wH', '<cmd>vertical resize -8<CR>', { desc = 'Narrower' })
vim.keymap.set('n', '<leader>wL', '<cmd>vertical resize +8<CR>', { desc = 'Wider' })
vim.keymap.set('n', '<leader>wJ', '<cmd>resize -8<CR>', { desc = 'Shorter' })
vim.keymap.set('n', '<leader>wK', '<cmd>resize +8<CR>', { desc = 'Taller' })

-- Clipboard
--
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d', { desc = 'Cut to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { desc = 'Paste before from clipboard' })

-- Formatting
vim.keymap.set({ "n", "v" }, "<leader>=", vim.lsp.buf.format, {
  desc = "Format",
})

-- mini.keymaps
--
local map_multistep = require('mini.keymap').map_multistep

map_multistep('i', '<Tab>', { 'pmenu_next' })
map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
map_multistep('i', '<BS>', { 'minipairs_bs' })

-- Make jump mappings or skip to use built-in <Tab>/<S-Tab> in Neovim>=0.11
local jump_next = function()
  if vim.snippet.active({ direction = 1 }) then return vim.snippet.jump(1) end
end
local jump_prev = function()
  if vim.snippet.active({ direction = -1 }) then vim.snippet.jump(-1) end
end
vim.keymap.set({ 'i', 's' }, '<C-l>', jump_next)
vim.keymap.set({ 'i', 's' }, '<C-h>', jump_prev)
