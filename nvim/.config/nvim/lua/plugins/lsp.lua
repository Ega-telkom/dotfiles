-- lua/plugins/lsp.lua

-- require("mason").setup()
-- require('mason-lspconfig').setup()
vim.lsp.enable({
    'gopls',
    'ts_ls',
    'pyright',
    'lua_ls',
    'eslint',
    'tailwindcss',
    'prismals',
    'html',
    'emmet_language_server'
})
