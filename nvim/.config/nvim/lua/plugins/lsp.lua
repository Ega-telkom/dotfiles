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
    'html_ls',
    'clangd',
    'rust_analyzer',
    'emmet_language_server',
    'css_ls',
    'vue_ls',
    'zls'
})
