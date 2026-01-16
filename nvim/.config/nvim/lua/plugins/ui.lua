-- lua/plugins/ui.lua

vim.g.adwaita_darker = true
vim.cmd.colorscheme("adwaita")

require("gitsigns").setup({
	 current_line_blame = true,
	 signcolumn = false,
})
require("stay-centered").setup()
