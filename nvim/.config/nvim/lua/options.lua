-- lua/options.lua

-- Basic
vim.opt.mouse = ""
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.o.splitright = true
vim.o.splitbelow = true

-- UI
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.winbar = ""        -- matiin winbar
vim.opt.laststatus = 3     -- statusline global (cuma 1, bukan per-window)

-- Buffers
vim.opt.hidden = true
vim.opt.swapfile = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
