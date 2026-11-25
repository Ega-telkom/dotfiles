return {
  cmd = { 'rust-analyzer', },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', '.git' },
  settings = {
    diagnostic = {
      enable = true,
      experimental = {
        enable = true
      }
    }
  },
}
