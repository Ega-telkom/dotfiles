return {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = {
    'html', 'css', 'scss',
    'javascript', 'javascriptreact',
    'typescript', 'typescriptreact',
    'vue'
  },
  root_markers = {
    'tailwind.config.js', 'tailwind.config.ts',
    'postcss.config.js', 'package.json', '.git',
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          -- biar clsx/cva/cn() ke-detect juga, bukan cuma className
          { 'cva\\(([^)]*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
          { 'cx\\(([^)]*)\\)', '(?:\'|"|`)([^\'"`]*)(?:\'|"|`)' },
        },
      },
    },
  },
}
