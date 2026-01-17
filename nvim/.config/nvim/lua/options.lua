-- lua/options.lua

vim.opt.signcolumn = "number"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 4
vim.opt.mouse = ""

vim.wo.signcolumn = "yes"
vim.o.statuscolumn = " %s %=%{v:relnum?v:relnum:v:lnum}│"

