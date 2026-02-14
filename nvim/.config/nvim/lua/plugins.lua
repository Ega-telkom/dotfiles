-- lua/plugins.lua

local deps = require("mini.deps")
deps.setup({
  path = { package = vim.fn.stdpath("data") .. "/site" },
})

local add = deps.add

-- UI
add({ source = "Mofiqul/adwaita.nvim" })
add({ source = "lewis6991/gitsigns.nvim" })

-- Snippets
add({ source = "rafamadriz/friendly-snippets" })

-- LSP
add({ source = "mason-org/mason-lspconfig.nvim" })
add({ source = "mason-org/mason.nvim" })
add({
  source = "neovim/nvim-lspconfig",
  depends = { "mason-org/mason.nvim" },
})
add({ source = "folke/lazydev.nvim" })

-- Formatting
add({ source = "Darazaki/indent-o-matic" })
add({
  source = 'nvim-treesitter/nvim-treesitter',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end }
})
add({ source = "nvim-treesitter/nvim-treesitter-textobjects", checkout = "main" })

-- Live Server
add({ source = "barrettruth/live-server.nvim" })

-- mini.nvim modules
local mini = {
  "mini.fuzzy",
  "mini.completion",
  "mini.comment",
  "mini.pairs",
  "mini-git",
  "mini.statusline",
  "mini.indentscope",
  "mini.files",
  "mini.icons",
  "mini.trailspace",
  "mini.hipatterns",
  "mini.cursorword",
  "mini.starter",
  "mini.diff",
  "mini.tabline",
  "mini.snippets",
  "mini.pick",
  "mini.bufremove",
  "mini.sessions",
  "mini.keymap",
}

for _, m in ipairs(mini) do
  add({ source = "nvim-mini/" .. m, checkout = 'stable' })
end
