return {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue'},
  root_markers = { 'eslint.config.js', '.eslintrc.json', '.eslintrc.js', 'package.json' },
}
