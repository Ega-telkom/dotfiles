-- lua/configs.lua

vim.diagnostic.config({
  signs = {
    linehl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticErrorLn",
      [vim.diagnostic.severity.WARN]  = "DiagnosticWarnLn",
      [vim.diagnostic.severity.INFO]  = "DiagnosticInfoLn",
      [vim.diagnostic.severity.HINT]  = "DiagnosticHintLn",
    },
  },
  underline = true,
  update_in_insert = true,
})
