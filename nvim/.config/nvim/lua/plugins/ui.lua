-- lua/plugins/ui.lua

vim.cmd.colorscheme("silentium")
require("gitsigns").setup({
	current_line_blame = true,
})

local silentium = require('silentium')

vim.api.nvim_set_hl(0, 'MiniPickMatchCurrent', { bg = silentium.colors.dark })
vim.api.nvim_set_hl(0, 'MiniFilesCursorLine',  { bg = silentium.colors.dark })
vim.api.nvim_set_hl(0, 'Visual',  { bg = silentium.colors.ghost })

