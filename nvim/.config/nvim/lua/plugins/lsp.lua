-- lua/plugins/lsp.lua

require("mason").setup()

vim.lsp.config.lua_ls = {
	 cmd = { 'lua-language-server' },
	 root_markers = { '.git', '.luarc.json', 'init.lua' },
	 settings = {
		  Lua = {
				runtime = { version = 'LuaJIT' },
				diagnostics = { globals = { 'vim' } },
				workspace = {
					 library = vim.api.nvim_get_runtime_file('', true),
					 checkThirdParty = false,
				},
				telemetry = { enable = false },
		  },
	 },
}

local lsps = {
  'rust_analyzer',
  'lua_ls',
  'pyright',
  'gopls',
  'ts_ls',
  'marksman',
  'html',
  'postgres_lsp',
  'kotlin_language_server',
  'mesonlsp',
  'intelephense',
  'jsonls',
  'vue_ls',
  'vtsls',
}

-- Enable all listed LSPs
for _, lsp in ipairs(lsps) do
  vim.lsp.config[lsp] = {
    cmd = { lsp },
    root_markers = { '.git' },
  }
  vim.lsp.enable(lsp)
end
