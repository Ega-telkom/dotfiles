require("options")
require("keymaps")
require("plugins")
require("configs")
require("autocmds")

-- Plugins
require("plugins.mini")
require("plugins.lsp")
require("plugins.formatting")
require("plugins.ui")
require("plugins.treesitter")
require("plugins.lazydev") 

-- LSP
require("lsp.gopls")
require("lsp.lua_ls")
require("lsp.pyright")
require("lsp.ts_ls")
require("lsp.prismals")
require("lsp.eslint")
