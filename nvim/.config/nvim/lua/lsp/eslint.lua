return {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'eslint.config.js', '.eslintrc.json', '.eslintrc.js', 'package.json' },
}
