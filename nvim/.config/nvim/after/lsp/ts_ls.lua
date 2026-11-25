local vue_path = vim.fn.expand('~/.npm-packages/lib/node_modules/@vue/language-server')

return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue' },
  root_markers = { 'package.json', 'tsconfig.json', '.git' },
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      },
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
}
