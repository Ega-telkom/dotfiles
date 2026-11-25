return {
    cmd = { 'clangd', '--background-index', '--clang-tidy' },
    filetypes = { 'c', 'h', 'Makefile' },
    root_markers = { 'Makefile', '.git' },
}
