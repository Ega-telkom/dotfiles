-- lua/plugins.lua

-- UI
vim.pack.add({ 'https://github.com/Mofiqul/adwaita.nvim' })
vim.pack.add({ 'https://github.com/dchinmay2/alabaster.nvim' })
vim.pack.add({ 'https://github.com/oskarnurm/koda.nvim' })
vim.pack.add({ 'https://github.com/nyoom-engineering/oxocarbon.nvim' })
vim.pack.add({ 'https://github.com/leojimenezg/minimal-madness-nvim' })
vim.pack.add({ 'https://github.com/elliotekj/enough.vim' })
vim.pack.add({ 'https://github.com/bettervim/yugen.nvim' })
vim.pack.add({ 'https://github.com/silentium-theme/silentium.nvim' })
vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })

-- Snippets
vim.pack.add({ 'https://github.com/rafamadriz/friendly-snippets' })

-- LSP
vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.pack.add({ 'https://github.com/mason-org/mason-lspconfig.nvim' })
vim.pack.add({ 'https://github.com/mason-org/mason.nvim' })
vim.pack.add({ 'https://github.com/folke/lazydev.nvim' })

-- Formatting
vim.pack.add({ 'https://github.com/Darazaki/indent-o-matic' })
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' })

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
  vim.pack.add({ 'https://github.com/nvim-mini/' .. m })
end
