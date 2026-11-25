-- lua/plugins/ui.lua

local silentium = require('silentium')

vim.cmd.colorscheme("silentium")
require("gitsigns").setup({
	current_line_blame = true,
})

vim.api.nvim_set_hl(0, 'MiniPickMatchCurrent', { bg = silentium.colors.dark })
vim.api.nvim_set_hl(0, 'MiniFilesCursorLine',  { bg = silentium.colors.dark })
vim.api.nvim_set_hl(0, 'Visual',  { bg = silentium.colors.ghost })
vim.api.nvim_set_hl(0, 'StatusLine',  { bg = silentium.accents.yellow, fg = silentium.colors.dark })
vim.api.nvim_set_hl(0, 'HighlightPatterns',  { bg = silentium.accents.yellow, fg = silentium.colors.dark })

