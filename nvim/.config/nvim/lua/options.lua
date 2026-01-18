-- lua/options.lua

-- Basic
vim.opt.mouse = ""
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 999
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.o.splitright = true
vim.o.splitbelow = true

-- UI
vim.opt.termguicolors = true
vim.opt.signcolumn = "number"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.wo.signcolumn = "yes"

-- Buffers
vim.opt.hidden = true
vim.opt.swapfile = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
